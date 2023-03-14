import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/models.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

final routeStopMapMarkersNearYouProvider =
    StreamProvider.autoDispose<Either<AppError, List<RouteCardData>>>(
        (AutoDisposeStreamProviderRef ref) async* {
  final stopsWithinBoundsStream =
      ref.watch(markersWithinMapBoundsProvider.stream);
  await for (final latestStops in stopsWithinBoundsStream) {
    yield latestStops.map((markersList) {
      final SplayTreeMap<String, RouteCardData> markersByRoute = SplayTreeMap();

      for (final marker in markersList) {
        RouteCardData? routeCardData;
        if (!markersByRoute.containsKey(marker.routeStop.route.name)) {
          routeCardData = RouteCardData(
              routeName: marker.routeStop.route.name,
              directedRouteData: SplayTreeMap());
          markersByRoute[marker.routeStop.route.name] = routeCardData;
        }
        routeCardData =
            routeCardData ?? markersByRoute[marker.routeStop.route.name];
        if (!routeCardData!.directedRouteData
            .containsKey(marker.routeStop.route)) {
          routeCardData.directedRouteData[marker.routeStop.route] = [];
        }
        routeCardData.directedRouteData[marker.routeStop.route]!.add(marker);
      }

      debugPrint(
          "[Provider] yielding data: routeStopMapMarkersNearYouProvider with final ${markersByRoute.values.length} entries");
      return markersByRoute.values.toList();
    });
  }
});
