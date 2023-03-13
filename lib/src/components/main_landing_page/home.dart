import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/map.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/panel_controller/panel_controller_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/panel_controller/scroll_controller_provider.dart';
import 'package:vamonos_mgp/src/components/navigation/drawer.dart';
import 'package:vamonos_mgp/src/components/navigation/menu_button.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';

import 'sliding_up_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageController createState() => HomePageController();
}

class HomePageController extends State<HomePage> {
  final double initFabHeight = 60;
  double fabHeight = 0;
  double panelHeightOpen = 300;
  final double panelHeightClosed = 80.0;
  bool searchBarFocused = false;

  @override
  void initState() {
    super.initState();
    fabHeight = initFabHeight;
  }

  void updateFabHeight(double newFabHeight) {
    setState(() {
      fabHeight = newFabHeight;
    });
  }

  void setSearchBarFocused(bool focused) {
    setState(() {
      searchBarFocused = focused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomePageView(this);
  }
}

class HomePageView extends WidgetView<HomePage, HomePageController> {
  const HomePageView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    state.panelHeightOpen =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      drawer: const HomeDrawer(),
      floatingActionButton: const FloatingMenuButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Material(
        child: Consumer(
          builder: (context, ref, child) => Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              SlidingUpPanel(
                  maxHeight: state.panelHeightOpen,
                  minHeight: state.panelHeightClosed,
                  parallaxEnabled: true,
                  controller: ref.watch(panelControllerProvider),
                  parallaxOffset: .7,
                  panelSnapping: false,
                  isDraggable: true,
                  body: const NavigationMap(),
                  panelBuilder: (sc) {
                    WidgetsBinding.instance.addPostFrameCallback((_) => ref
                        .read(panelScrollControllerProvider.notifier)
                        .setScrollController(sc));
                    return SlidingUpDrawer(sc);
                  },
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  onPanelSlide: (double pos) => state.updateFabHeight(
                      pos * (state.panelHeightOpen - state.panelHeightClosed) +
                          state.initFabHeight)),
              RecenterMapButton(
                panelHeightClosed: state.panelHeightClosed,
                panelHeightOpen: state.panelHeightOpen,
                fabHeight: state.fabHeight,
              ),
              const FloatingBlurredBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class RecenterMapButton extends ConsumerWidget {
  const RecenterMapButton(
      {super.key,
      required double panelHeightOpen,
      required double fabHeight,
      required double panelHeightClosed})
      : _panelHeightOpen = panelHeightOpen,
        _panelHeightClosed = panelHeightClosed,
        _fabHeight = fabHeight;

  final double _panelHeightOpen;
  final double _fabHeight;
  final double _panelHeightClosed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
        right: 20,
        top: _panelHeightOpen - _fabHeight - _panelHeightClosed,
        child: Consumer(
          builder: (context, ref, child) => FloatingActionButton(
            onPressed: () {
              ref
                  .read(mapControllerServiceProvider.notifier)
                  .recenterMapLocation();
              ref.read(mapControllerServiceProvider.future).then((mc) => mc
                  .mapEventSink
                  .add(MapEventInitialized(center: mc.center, zoom: mc.zoom)));
            },
            backgroundColor: Colors.white,
            child: Icon(
              Icons.near_me_sharp,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ));
  }
}

/// floating blurred bar on top
class FloatingBlurredBar extends StatelessWidget {
  const FloatingBlurredBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        child: ClipRRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).padding.top,
                  color: Colors.transparent,
                ))));
  }
}
