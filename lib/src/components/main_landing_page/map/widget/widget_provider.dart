import 'package:flutter/material.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/widget.dart';
import 'package:vamonos_mgp/src/services/location/location_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';

part 'widget_provider.g.dart';

@riverpod
Widget navigationMapViewWidget(NavigationMapViewWidgetRef ref) {
  return ref.watch(locationServiceProvider).maybeWhen(
      data: (locationData) => ref.watch(mapControllerServiceProvider).maybeWhen(
          data: (mapController) =>
              NavigationMapView(locationData, mapController),
          orElse: () => const Text("An error occurred fetching location data")),
      orElse: () => const Text("An error occurred fetching location data"));
}

@riverpod
PopupController popupController(PopupControllerRef ref) => PopupController();
