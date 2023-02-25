import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vamonos_mgp/components/common/widget_view.dart';
import 'package:vamonos_mgp/components/main_landing_page/routes_near_you_list/widget.dart';
import 'package:vamonos_mgp/components/map.dart';

import 'floating_search_bar.dart';

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
  final PanelController panelController = PanelController();

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

class HomePageView extends WidgetView<HomePage, HomePageController> {
  const HomePageView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    state.panelHeightOpen = MediaQuery.of(context).size.height;

    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
              maxHeight: state.panelHeightOpen,
              minHeight: state.panelHeightClosed,
              parallaxEnabled: true,
              controller: state.panelController,
              parallaxOffset: .7,
              panelSnapping: false,
              body: const NavigationMap(),
              panelBuilder: (sc) => SlidingUpDrawer(sc),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              onPanelSlide: (double pos) => state.updateFabHeight(
                  pos * (state.panelHeightOpen - state.panelHeightClosed) +
                      state.initFabHeight)),

          /// floating search bar
          FloatingSearchBar(
              panelHeightOpen: state.panelHeightOpen,
              fabHeight: state.fabHeight,
              panelHeightClosed: state.panelHeightClosed,
              panelController: state.panelController),
          // floating blurred bar on top
          Positioned(
              top: 0,
              child: ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).padding.top,
                        color: Colors.transparent,
                      )))),
        ],
      ),
    );
  }
}

class SlidingUpDrawer extends StatelessWidget {
  final ScrollController sc;

  const SlidingUpDrawer(
    this.sc, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoutesNearYouList(sc);
  }
}
