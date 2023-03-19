import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/models.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/route_card/view.dart';

class RouteCard extends StatefulWidget {
  final RouteCardData data;
  final String routeName;

  const RouteCard({required this.routeName, required this.data, super.key});

  @override
  State<RouteCard> createState() => RouteCardController();
}

class RouteCardController extends State<RouteCard> {
  final ValueNotifier<int> valueNotifier = ValueNotifier(0);
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return RouteCardView(this);
  }
}
