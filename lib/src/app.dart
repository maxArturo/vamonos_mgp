import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vamonos_mgp/src/components/onboard/widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vamonos - MGP',
        builder: FToastBuilder(),
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Colors.lightBlue.shade400),
        ),
        home: const OnboardingPage());
  }
}
