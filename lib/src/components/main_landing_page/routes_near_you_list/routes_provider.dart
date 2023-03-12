import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/models.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

final routeStopMapMarkersNearYouProvider =
    StreamProvider.autoDispose<Either<AppError, RouteCardData>>(
        (AutoDisposeStreamProviderRef ref) async* {
  final stopsWithinBoundsStream =
      ref.watch(markersWithinMapBoundsProvider.stream);
  await for (final latestStops in stopsWithinBoundsStream) {
    yield latestStops.map((markersList) {
      final RouteCardData markersByRoute = SplayTreeMap();

      for (final marker in markersList) {
        if (!markersByRoute.containsKey(marker.routeStop.route.name)) {
          markersByRoute[marker.routeStop.route.name] = SplayTreeMap();
        }
        final routeMap = markersByRoute[marker.routeStop.route.name];
        if (!routeMap!.containsKey(marker.routeStop.route)) {
          routeMap[marker.routeStop.route] = [];
        }
        routeMap[marker.routeStop.route]!.add(marker);
      }
      return markersByRoute;
    });
  }
});
