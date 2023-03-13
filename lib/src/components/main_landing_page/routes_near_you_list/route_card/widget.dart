import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/models.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/route_card/view.dart';

class RouteCard extends ConsumerStatefulWidget {
  final RouteCardData data;
  final String routeName;

  const RouteCard({required this.routeName, required this.data, super.key});

  @override
  ConsumerState<RouteCard> createState() => RouteCardController();
}

class RouteCardController extends ConsumerState<RouteCard> {
  final ValueNotifier<int> valueNotifier = ValueNotifier(0);
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return RouteCardView(this);
  }
}
