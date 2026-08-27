import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

TransitionBuilder responsiveWrapper() {
  return (BuildContext context, Widget? child) =>
      ResponsiveBreakpoints.builder(child: child!, breakpoints: const [
        Breakpoint(start: 0, end: 480, name: MOBILE),
        Breakpoint(
            start: 481,
            end: 800,
            name:
                TABLET), //  ResponsiveBreakpoint.autoScale(800, name: TABLET),
        Breakpoint(
            start: 801,
            end: 1000,
            name:
                DESKTOP), //  ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        Breakpoint(
            start: 1001,
            end: double.infinity,
            name: 'XL'), //  ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
      ]);
}
