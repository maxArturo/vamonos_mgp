import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_landmark.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/services/map/landmark_provider.dart';

polylineLayer({required DirectedRoute directedRoute}) {
  return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
    return ref
        .watch(AllLandMarksBySourceProvider(
            provider: TransportationProvider.municipioGeneralPurreydon))
        .maybeWhen(
            orElse: () => const Text("An unhandled error occurred"),
            loading: () => const Text("loading..."),
            data: (data) => data.fold(
                    (l) => Text("An error of type ${l.errorType} occurred"),
                    (routeStops) {
                  final polyLine = toPolyLine(routeStops, directedRoute);
                  return polylineWidget(polyLines: [polyLine]);
                }));
  });
}

polylineWidget({required List<Polyline> polyLines}) =>
    PolylineLayer(polylineCulling: true, polylines: polyLines);

Polyline toPolyLine(
    List<RouteLandMark> routeStops, DirectedRoute directedRoute) {
  final filteredStops = routeStops
      .where((stop) =>
          stop.route.canonicalIdentifier == directedRoute.canonicalIdentifier &&
          stop.route.id == directedRoute.id)
      .toList();

  return Polyline(
      color: Colors.blue,
      strokeWidth: 7.0,
      points: filteredStops
          .map((stop) =>
              LatLng(stop.location.latitude!, stop.location.longitude!))
          .toList());
}
