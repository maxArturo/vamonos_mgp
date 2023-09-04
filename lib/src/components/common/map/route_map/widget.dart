import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamonos_mgp/src/components/common/map/config.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';
import 'package:vamonos_mgp/src/components/common/map/route_map/view.dart';
import 'package:vamonos_mgp/src/entities/coordinate.dart';
import 'package:vamonos_mgp/src/entities/map_browser_view.dart';
import 'package:vamonos_mgp/src/entities/route.dart';

class RouteMap extends StatefulWidget {
  final MapBrowserView view = MapBrowserView.routeView;
  final DirectedRoute directedRoute;
  final Coordinate? initialLocation;
  final StopMarker? selectedMarker;

  const RouteMap({
    super.key,
    required this.directedRoute,
    this.initialLocation,
    this.selectedMarker,
  });

  @override
  State<RouteMap> createState() => RouteMapController();
}

class RouteMapController extends State<RouteMap> {
  final MapController mc = MapController();

  @override
  Widget build(BuildContext context) {
    return RouteMapView(this,
        initialLocation: widget.initialLocation ?? defaultCenterLocation);
  }
}
