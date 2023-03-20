import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/common/map/route_map/view.dart';
import 'package:vamonos_mgp/src/entities/map_browser_view.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/services/location/location_provider.dart';

class RouteMap extends ConsumerStatefulWidget {
  final MapBrowserView view = MapBrowserView.routeView;
  final DirectedRoute directedRoute;
  final LocationData? initialLocation;
  final List<StopMarker> stops;

  const RouteMap({
    super.key,
    required this.directedRoute,
    this.initialLocation,
    required this.stops,
  });

  @override
  ConsumerState<RouteMap> createState() => RouteMapController();
}

class RouteMapController extends ConsumerState<RouteMap> {
  final MapController mc = MapController();

  @override
  Widget build(BuildContext context) {
    if (widget.initialLocation != null) {
      return RouteMapView(this, initialLocation: widget.initialLocation!);
    }

    return ref.watch(locationServiceProvider).maybeWhen(
        data: (locationData) =>
            RouteMapView(this, initialLocation: locationData),
        orElse: () => const Text("An error occurred fetching location data"));
  }
}
