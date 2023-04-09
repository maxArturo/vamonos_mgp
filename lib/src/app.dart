import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vamonos_mgp/src/components/springboard.dart';
import 'package:vamonos_mgp/src/util/builder_wrapper.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vamonos - MGP',
        builder: responsiveWrapper(),
        theme: ThemeData(
          useMaterial3: true,
          textTheme: TextTheme(
            titleMedium: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
            bodyMedium: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            titleLarge: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          colorScheme:
              ColorScheme.fromSeed(seedColor: Colors.lightBlue.shade400),
        ),
        home: const SpringboardWidget());
  }
}
