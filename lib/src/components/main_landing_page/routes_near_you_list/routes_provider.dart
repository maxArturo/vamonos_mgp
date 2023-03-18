import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/models.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

final routeStopMapMarkersNearYouProvider =
    StreamProvider.autoDispose<Either<AppError, List<RouteCardData>>>(
        (AutoDisposeStreamProviderRef ref) async* {
  final mapController = await ref.watch(stopViewMapControllerProvider.future);

  final stopsWithinBoundsStream =
      ref.watch(markersWithinMapBoundsProvider.stream);

  await for (final latestStops in stopsWithinBoundsStream) {
    yield latestStops.map((markersList) {
      final mapCenter = mapController.center;
      final SplayTreeMap<String, StopMarker> closestMarkerByDirectedRoute =
          SplayTreeMap();

      for (final marker in markersList) {
        if (!closestMarkerByDirectedRoute
            .containsKey(marker.routeStop.route.canonicalIdentifier)) {
          closestMarkerByDirectedRoute[
              marker.routeStop.route.canonicalIdentifier] = marker;
        } else {
          final currentClosest = closestMarkerByDirectedRoute[
              marker.routeStop.route.canonicalIdentifier]!;
          if (getTotalDistance(currentClosest.point, mapCenter) >
              getTotalDistance(marker.point, mapCenter)) {
            closestMarkerByDirectedRoute[
                marker.routeStop.route.canonicalIdentifier] = marker;
          }
        }
      }

      final Map<String, List<StopMarker>> result = {};
      for (final marker in closestMarkerByDirectedRoute.values) {
        if (!result.containsKey(marker.routeStop.route.name)) {
          result[marker.routeStop.route.name] = [marker];
        } else {
          result[marker.routeStop.route.name]!.add(marker);
        }
      }

      return result.entries
          .map((e) => RouteCardData(
              routeName: e.key, closestStopsByUniqueDirection: e.value))
          .toList();
    });
  }
});

getTotalDistance(LatLng coordinates, LatLng other) =>
    coordinates.latitude -
    other.latitude +
    coordinates.longitude -
    other.longitude;
