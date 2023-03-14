import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/widget.dart';
import 'package:vamonos_mgp/src/services/location/location_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';

class NavigationMap extends ConsumerStatefulWidget {
  const NavigationMap({super.key});

  @override
  ConsumerState<NavigationMap> createState() => NavigationMapController();
}

class NavigationMapController extends ConsumerState<NavigationMap> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(locationServiceProvider).maybeWhen(
        data: (locationData) => ref
            .watch(mapControllerServiceProvider)
            .maybeWhen(
                data: (mapController) =>
                    NavigationMapView(locationData, mapController),
                orElse: () =>
                    const Text("An error occurred fetching location data")),
        orElse: () => const Text("An error occurred fetching location data"));
  }
}
