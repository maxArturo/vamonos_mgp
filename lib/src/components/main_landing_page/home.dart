import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vamonos_mgp/src/components/common/toast.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/map.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers_provider.dart';
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
  late FToast fToast;
  final double initFabHeight = 60;
  double fabHeight = 0;
  double panelHeightOpen = 300;
  double panelHeightClosed = 100.0;
  bool searchBarFocused = false;

  @override
  void initState() {
    super.initState();
    fabHeight = initFabHeight;
    fToast = FToast();
    fToast.init(context);
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
    state.panelHeightOpen = MediaQuery.of(context).size.height * 0.6;
    state.panelHeightClosed = MediaQuery.of(context).size.height * 0.2;

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        // TODO review best way to display this toastbar
        ref.listen(allMarkersProvider, (prev, curr) {
          curr.maybeWhen(
              data: (data) => state.fToast.showToast(
                  gravity: ToastGravity.TOP,
                  child: BaseToast(
                      toastText: data.fold((l) => "Got error of ${l.errorType}",
                          (r) => "Got ${r.length} stops"))),
              orElse: () {});
        });
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
                      body: NavigationMap(
                        view: MapBrowserView.stopView,
                      ),
                      panelBuilder: (sc) {
                        final optionController =
                            ref.watch(panelScrollControllerProvider);
                        if (optionController.isNone()) {
                          WidgetsBinding.instance.addPostFrameCallback((_) =>
                              ref
                                  .read(panelScrollControllerProvider.notifier)
                                  .setScrollController(sc));
                        }

                        return SlidingUpDrawer(sc);
                      },
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                      onPanelSlide: (double pos) => state.updateFabHeight(pos *
                              (state.panelHeightOpen -
                                  state.panelHeightClosed) +
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
      },
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
      // top: max(panelHeightOpen - panelHeightClosed,
      //         MediaQuery.of(context).size.height - 120) -
      //     fabHeight,
      top: panelHeightOpen +
          MediaQuery.of(context).size.height * 0.1 -
          fabHeight,
      child: FloatingActionButton(
        onPressed: () => recenterLocation(),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.near_me_sharp,
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
