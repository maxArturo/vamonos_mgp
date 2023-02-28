import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vamonos_mgp/components/common/widget_view.dart';
import 'package:vamonos_mgp/components/main_landing_page/home/home_provider.dart';
import 'package:vamonos_mgp/components/main_landing_page/sliding_up_drawer.dart';
import 'package:vamonos_mgp/components/map.dart';

import '../floating_search_bar.dart';

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
    state.panelHeightOpen = MediaQuery.of(context).size.height;

    return Material(
      child: ChangeNotifierProvider(
        create: (_) => HomeComponentProvider(),
        child: Consumer<HomeComponentProvider>(
          builder: (context, provider, child) => Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              SlidingUpPanel(
                  maxHeight: state.panelHeightOpen,
                  minHeight: state.panelHeightClosed,
                  parallaxEnabled: true,
                  controller: provider.panelController,
                  parallaxOffset: .7,
                  panelSnapping: false,
                  isDraggable: provider.drawerDraggable,
                  body: const NavigationMap(),
                  panelBuilder: (sc) => SlidingUpDrawer(sc),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  onPanelSlide: (double pos) => state.updateFabHeight(
                      pos * (state.panelHeightOpen - state.panelHeightClosed) +
                          state.initFabHeight)),
              FloatingSearchBar(
                  panelHeightOpen: state.panelHeightOpen,
                  fabHeight: state.fabHeight,
                  panelHeightClosed: state.panelHeightClosed,
                  panelController: provider.panelController),
              const FloatingBlurredBar(),
            ],
          ),
        ),
      ),
    );
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
