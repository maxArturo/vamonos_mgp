import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/route_card/view.dart';

class RouteCard extends ConsumerStatefulWidget {
  final List<StopMarker> markerList;

  const RouteCard({required this.markerList, super.key});

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
