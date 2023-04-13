import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

TransitionBuilder responsiveWrapper() {
  return (BuildContext context, Widget? child) =>
      ResponsiveWrapper.builder(child,
          // maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
          ],
          background: Container(color: const Color(0xFFF5F5F5)));
}
