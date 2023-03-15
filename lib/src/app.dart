import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'components/main_landing_page/home.dart';

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
        home: const HomePage());
  }
}
