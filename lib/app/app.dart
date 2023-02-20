import 'package:flutter/material.dart';
import 'package:vamonos_mgp/components/main_drawer.dart';
import 'package:vamonos_mgp/components/map.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vamonos - MGP',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Colors.lightBlue.shade400),
        ),
        // home: const Placeholder(
        //   child: Center(child: Text("landing page goes here")),
        // ));
        // home: NavigationMap(key: super.key),
        home: const MainDrawer());
  }
}
