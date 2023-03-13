import 'dart:collection';

import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/entities/route.dart';

class RouteCardData {
  final String routeName;
  final SplayTreeMap<DirectedRoute, List<StopMarker>> directedRouteData;

  RouteCardData({required this.routeName, required this.directedRouteData});
}
