import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  NavigationMap({super.key, required this.view, this.directedRoute}) {
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
    return ref.watch(locationServiceProvider).maybeWhen(
        data: (locationData) =>
            NavigationMapView(this, initialLocation: locationData),
        orElse: () => const Text("An error occurred fetching location data"));
  }
}
