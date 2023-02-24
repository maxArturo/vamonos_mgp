import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vamonos_mgp/components/main_landing_page/routes_list/widget.dart';
import 'package:vamonos_mgp/components/map.dart';
import 'package:vamonos_mgp/providers/location.dart';
import 'package:vamonos_mgp/providers/map.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LocationProviderStore>(
              create: (_) => LocationProviderStore()),
          Provider<MapProviderStore>(create: (_) => MapProviderStore()),
        ],
        child: MaterialApp(
            title: 'Vamonos - MGP',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme:
                  ColorScheme.fromSeed(seedColor: Colors.lightBlue.shade400),
            ),
            home: const HomePage()));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final double _initFabHeight = 60;
  double _fabHeight = 0;
  double _panelHeightOpen = 300;
  final double _panelHeightClosed = 80.0;

  @override
  void initState() {
    super.initState();
    _fabHeight = _initFabHeight;
  }

  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height;

    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            controller: _panelController,
            parallaxOffset: .5,
            panelSnapping: false,
            body: const NavigationMap(),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),

          // floating search bar
          Positioned(
            // these pixel dimensions below (left, right) ensure boundaries
            // for the poisitioned search bars
            left: 10,
            right: 10,
            top: max(MediaQuery.of(context).padding.top,
                _panelHeightOpen - _fabHeight - _panelHeightClosed),
            // bottom: min(
            //     _fabHeight,
            //     _panelHeightOpen -
            //         max(MediaQuery.of(context).padding.top * 2, 60)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    final updateMap =
                        Provider.of<MapProviderStore>(context, listen: false)
                            .updateMapLocation;
                    final getLocationData = Provider.of<LocationProviderStore>(
                            context,
                            listen: false)
                        .currentLocationData;

                    debugPrint("we're about to change provider store data@!");
                    getLocationData.then((newLocation) {
                      debugPrint("ok got data, about to update map");
                      updateMap(newLocation);
                    });
                  },
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.gps_fixed,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    // controller: _emailController,
                    keyboardType: TextInputType.streetAddress,
                    // cursorColor: currentTheme.colorScheme.secondary,
                    onTap: () {
                      _panelController.animatePanelToPosition(
                        0.5,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    },
                    decoration: InputDecoration(
                      hintText: "Where do you want to go?",
                      filled: true,
                      fillColor: Colors.amber,
                      prefixIcon: Icon(Icons.search,
                          color: Theme.of(context).primaryColor),
                      // errorText: (_emailError) ? "Invalid Email" : null,
                      border: const UnderlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                ),
              ],
            ),
          ),
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

          //the SlidingUpPanel Title
          // Positioned(
          //   top: 60.0,
          //   child: Container(
          //     padding: const EdgeInsets.fromLTRB(24.0, 18.0, 24.0, 18.0),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(24.0),
          //       boxShadow: [
          //         const BoxShadow(
          //             color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 16.0)
          //       ],
          //     ),
          //     child: const Text(
          //       "Any status notifications can go here!",
          //       style: TextStyle(fontWeight: FontWeight.w500),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context, removeTop: true, child: RoutesNearYouList(sc));
  }
}
