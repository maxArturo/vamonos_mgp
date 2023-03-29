import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:vamonos_mgp/src/components/onboard/view.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    super.key,
  });

  @override
  State<OnboardingPage> createState() => OnboardingPageController();
}

class OnboardingPageController extends State<OnboardingPage> {
  int page = 0;
  late LiquidController liquidController;
  late UpdateType updateType;
  List<OnboardingData> pagesData = [
    OnboardingData(
        assetLocation: 'assets/images/page_one_map.png',
        color: Colors.blueAccent,
        text: 'Hey from first page'),
    OnboardingData(
        assetLocation: 'assets/images/page_two_routes.png',
        color: Colors.greenAccent,
        text: 'Hey from second page'),
    OnboardingData(
        assetLocation: 'assets/images/page_three_map_arrivals.png',
        color: Colors.purpleAccent,
        text: 'Hey from third page'),
  ];

  @override
  Widget build(BuildContext context) {
    return OnboardingPageView(this);
  }

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  pageChangeCallback(int currPage) {
    setState(() {
      page = currPage;
    });
  }
}

class OnboardingData {
  final String assetLocation;
  final Color color;
  final String text;

  OnboardingData(
      {required this.assetLocation, required this.color, required this.text});
}
