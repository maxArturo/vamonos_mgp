import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/directed_routes_page/directed_routes_card/view.dart';
import 'package:vamonos_mgp/src/entities/route.dart';

class DirectedRouteCard extends ConsumerStatefulWidget {
  final DirectedRoute directedRoute;
  final List<StopMarker> stops;

  const DirectedRouteCard(
      {required this.directedRoute, required this.stops, super.key});

  @override
  ConsumerState<DirectedRouteCard> createState() =>
      DirectedRouteCardController();
}

class DirectedRouteCardController extends ConsumerState<DirectedRouteCard> {
  @override
  Widget build(BuildContext context) {
    return DirectedRouteCardView(this);
  }
}
