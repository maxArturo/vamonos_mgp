import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:quiver/iterables.dart';
import 'package:vamonos_mgp/src/entities/route_landmark.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/services/map/landmark_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';

polylineLayer() {
  return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
    return ref.watch(mapEventStreamProvider).maybeWhen(
          data: (mapEventWithBounds) {
            debugPrint("map event emitted: ${mapEventWithBounds.source}");
            return ref
                .watch(AllLandMarksBySourceProvider(
                    provider: TransportationProvider.municipioGeneralPurreydon))
                .maybeWhen(
                    orElse: () => const Text("An unhandled error occurred"),
                    loading: () => const Text("loading..."),
                    data: (data) => data.fold(
                            (l) => Text("An error of type ${l.error} occurred"),
                            (routeStops) {
                          final polyLines = toPolyLines(
                              routeStops, mapEventWithBounds.bounds!);
                          return polylineWidget(polyLines: polyLines);
                        }));
          },
          loading: () => const Text("loading..."),
          orElse: () => const Text("An unhandled error occurred"),
        );
  });
}

polylineWidget({required List<Polyline> polyLines}) =>
    PolylineLayer(polylineCulling: true, polylines: polyLines);

List<Polyline> toPolyLines(
    List<RouteLandMark> routeStops, LatLngBounds bounds) {
  final availableColors = cycle([
    Colors.blue,
    Colors.lightGreen,
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.purpleAccent
  ]).iterator;

  final Map<String, Set<RouteLandMark>> stopsByRoute = {};

  for (final stop in routeStops) {
    if (!stopsByRoute.containsKey(stop.route.direction)) {
      stopsByRoute[stop.route.direction] = <RouteLandMark>{};
    }
    stopsByRoute[stop.route.direction]?.add(stop);
  }

  final List<Polyline> lines = stopsByRoute.keys.map((route) {
    availableColors.moveNext();
    final color = availableColors.current;
    final initListOfStops = stopsByRoute[route]!
        // .where((element) => element.isStoppingPoint)
        .toList();

    return Polyline(
        color: color,
        strokeWidth: 5.0,
        points: initListOfStops
            .map((stop) =>
                LatLng(stop.location.latitude!, stop.location.longitude!))
            // .where((stop) => bounds.contains(stop))
            .toList());
  }).toList();

  return [lines[4]];
}
