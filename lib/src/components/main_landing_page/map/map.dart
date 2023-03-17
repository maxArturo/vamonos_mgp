import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/widget.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/services/location/location_provider.dart';

enum MapBrowserView {
  stopView,
  routeView,
}

class NavigationMap extends ConsumerStatefulWidget {
  final MapBrowserView view;
  final DirectedRoute? directedRoute;
  final LocationData? initialLocation;
  final List<StopMarker>? stopMarkers;

  NavigationMap(
      {super.key,
      required this.view,
      this.directedRoute,
      this.stopMarkers,
      this.initialLocation}) {
    if (view == MapBrowserView.routeView) {
      directedRoute!;
    }
  }

  @override
  ConsumerState<NavigationMap> createState() => NavigationMapController();
}

class NavigationMapController extends ConsumerState<NavigationMap> {
  final MapController mc = MapController();

  @override
  void initState() {
    debugPrint("[NavigationMapController] base controller initialized on init");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.initialLocation != null) {
      return NavigationMapView(this, initialLocation: widget.initialLocation!);
    }

    return ref.watch(locationServiceProvider).maybeWhen(
        data: (locationData) =>
            NavigationMapView(this, initialLocation: locationData),
        orElse: () => const Text("An error occurred fetching location data"));
  }
}
