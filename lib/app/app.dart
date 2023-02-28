import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vamonos_mgp/providers/location.dart';

import '../components/main_landing_page/home/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LocationProviderStore>(
              create: (_) => LocationProviderStore()),
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
