import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/src/components/common/map/stop_view_map/view.dart';
import 'package:vamonos_mgp/src/entities/map_browser_view.dart';
import 'package:vamonos_mgp/src/services/location/location_provider.dart';

class StopMap extends ConsumerStatefulWidget {
  final MapBrowserView view = MapBrowserView.stopView;
  final LocationData? initialLocation;

  const StopMap({super.key, this.initialLocation});

  @override
  ConsumerState<StopMap> createState() => StopMapController();
}

class StopMapController extends ConsumerState<StopMap> {
  final MapController mc = MapController();

  @override
  Widget build(BuildContext context) {
    if (widget.initialLocation != null) {}
    return ref.watch(locationServiceProvider).maybeWhen(
        data: (locationData) =>
            StopMapView(this, initialLocation: locationData),
        orElse: () => const Text("An error occurred fetching location data"));
  }
}
