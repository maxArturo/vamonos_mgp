import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/route_stop_detail/card/view.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';

class RouteStopCard extends ConsumerStatefulWidget {
  final RouteStop routeStop;
  final StopMarker marker;

  const RouteStopCard(
      {required this.routeStop, required this.marker, super.key});

  @override
  ConsumerState<RouteStopCard> createState() => RouteStopCardController();
}

class RouteStopCardController extends ConsumerState<RouteStopCard> {
  @override
  Widget build(BuildContext context) {
    return RouteStopCardView(this);
  }
}
