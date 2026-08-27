import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/markers_provider.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/models.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

final routeStopMapMarkersNearYouProvider =
    FutureProvider.autoDispose<Either<AppError, List<RouteCardData>>>(
        (ref) async {
  final mapController = await ref.watch(stopViewMapControllerProvider.future);
  final latestMarkers = await ref.watch(markersWithinMapBoundsProvider.future);

  return latestMarkers.map((markersList) {
    final mapCenter = mapController.center;
    final SplayTreeMap<DirectedRoute, RouteStopMarker>
        closestMarkerByDirectedRoute = SplayTreeMap();

    // create set mapping of route -> map marker, by closest to map
    // center
    for (final marker in markersList) {
      for (final stop in marker.routeStops) {
        final currClosest = closestMarkerByDirectedRoute[stop.route];

        if (currClosest == null) {
          closestMarkerByDirectedRoute[stop.route] =
              RouteStopMarker(stop: stop, marker: marker);
        } else {
          if (_getTotalDistance(currClosest.marker.point, mapCenter) >
              _getTotalDistance(marker.point, mapCenter)) {
            closestMarkerByDirectedRoute[stop.route] =
                RouteStopMarker(stop: stop, marker: marker);
          }
        }
      }
    }

    final Map<String, List<RouteStopMarker>> result = {};

    for (final markerEntry in closestMarkerByDirectedRoute.entries) {
      // collect all stop markers for a given route, for all directions
      final currMarkerEntry = result[markerEntry.key.name];
      if (currMarkerEntry == null) {
        result[markerEntry.key.name] = [markerEntry.value];
      } else {
        currMarkerEntry.add(markerEntry.value);
      }
    }

    final res = result.entries
        .map((e) =>
            RouteCardData(displayedRouteName: e.key, routeStopMarkers: e.value))
        .toList();

    return res;
  });
});

_getTotalDistance(LatLng coordinates, LatLng other) =>
    coordinates.latitude -
    other.latitude +
    coordinates.longitude -
    other.longitude;
