import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vamonos_mgp/src/components/common/map/stop_view_map/widget.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/home/panel_controller/panel_controller_provider.dart';
import 'package:vamonos_mgp/src/components/home/panel_controller/scroll_controller_provider.dart';
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
  double panelHeightClosed = 100.0;

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

  @override
  Widget build(BuildContext context) {
    return HomePageView(this);
  }
}

class HomePageView extends ConsumerWidgetView<HomePage, HomePageController> {
  const HomePageView(super.state, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    state.panelHeightOpen = MediaQuery.of(context).size.height * 0.6;
    state.panelHeightClosed = MediaQuery.of(context).size.height * 0.2;

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
                  body: const StopMap(),
                  panelBuilder: (sc) {
                    ref
                        .watch(panelScrollControllerProvider.notifier)
                        .initialize(sc);

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
                recenterLocation: ref
                    .watch(stopViewMapControllerProvider.notifier)
                    .recenterMapLocation,
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
      required this.panelHeightOpen,
      required this.fabHeight,
      required this.panelHeightClosed,
      required this.recenterLocation});

  final double panelHeightOpen;
  final double fabHeight;
  final double panelHeightClosed;
  final void Function() recenterLocation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      right: 20,
      top: panelHeightOpen +
          MediaQuery.of(context).size.height * 0.15 -
          fabHeight,
      child: FloatingActionButton(
        onPressed: () => recenterLocation(),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.gps_fixed_sharp,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

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
