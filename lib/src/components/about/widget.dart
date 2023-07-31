import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/about/view.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({
    super.key,
  });

  @override
  State<AboutPage> createState() => AboutPageController();
}

class AboutPageController extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return AboutPageView(
      this,
    );
  }
}
