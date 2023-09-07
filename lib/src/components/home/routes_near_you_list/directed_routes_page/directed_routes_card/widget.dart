import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/directed_routes_page/directed_routes_card/view.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/models.dart';

class DirectedRouteCard extends StatefulWidget {
  final RouteStopMarker stopAndMarker;

  const DirectedRouteCard({required this.stopAndMarker, super.key});

  @override
  State<DirectedRouteCard> createState() => DirectedRouteCardController();
}

class DirectedRouteCardController extends State<DirectedRouteCard> {
  @override
  Widget build(BuildContext context) {
    return DirectedRouteCardView(this);
  }
}
