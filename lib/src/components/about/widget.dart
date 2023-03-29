import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamonos_mgp/src/components/about/view.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({
    super.key,
  });

  @override
  State<AboutPage> createState() => AboutPageController();
}

class AboutPageController extends State<AboutPage> {
  final MapController mc = MapController();

  @override
  Widget build(BuildContext context) {
    return AboutPageView(
      this,
    );
  }
}
