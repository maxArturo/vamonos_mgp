import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';
import 'package:vamonos_mgp/src/entities/coordinate.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/services/map/landmark_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_event_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'markers_provider.g.dart';

// NOTE: this is not ideal. It relies on the coordinates being literally
// identical which may not be the case in the future.
Map<Coordinate, List<RouteStop>> _coalesceRouteStopsByCoordinate(
    List<RouteStop> stops) {
  final Map<Coordinate, List<RouteStop>> stopsByCoordinate = {};
  for (final stop in stops) {
    if (!stopsByCoordinate.containsKey(stop.location)) {
      stopsByCoordinate[stop.location] = [stop];
    } else {
      stopsByCoordinate[stop.location]!.add(stop);
    }
  }
  return stopsByCoordinate;
}

@riverpod
Future<Either<AppError, List<StopMarker>>> allMarkers(AllMarkersRef ref) async {
  final data = await ref.watch(allStopsBySourceProvider.future);

  final gatherStopsByCoords = data.map(_coalesceRouteStopsByCoordinate);

  final response = gatherStopsByCoords.flatMap<List<StopMarker>>((stopsMap) {
    try {
      final stopMarkers = stopsMap.entries
          .map((routeStops) => StopMarker(
              coordinate: routeStops.key, routeStops: routeStops.value))
          .toList();
      return Right(stopMarkers);
    } catch (e) {
      return Left(ParsingError(description: e.toString()));
    }
  });
  return response;
}

@riverpod
Future<Either<AppError, List<StopMarker>>> allMarkersByRoute(
    AllMarkersRef ref, DirectedRoute directedRoute) async {
  final data =
      await ref.watch(allStopsByRouteProvider(route: directedRoute).future);

  final response = data.flatMap<List<StopMarker>>((stops) {
    try {
      final stopMarkers = stops
          .where((el) => el.isStoppingPoint)
          .map((routeStop) => StopMarker(
              coordinate: routeStop.location, routeStops: [routeStop]))
          .toList();
      return Right(stopMarkers);
    } catch (e) {
      return Left(ParsingError());
    }
  });
  return response;
}

final markersWithinMapBoundsProvider =
    FutureProvider.autoDispose<Either<AppError, List<StopMarker>>>((ref) async {
  final allMarkers = await ref.watch(allMarkersProvider.future);
  final event = await ref.watch(stopMapOnEndEventStreamProvider.future);

  return allMarkers.flatMap((markerList) {
    return catching(() {
      final result = markerList
          .where((marker) => event.bounds.contains(
              LatLng(marker.coordinate.latitude, marker.coordinate.longitude)))
          .toList();

      return result;
    }).leftMap((e) => ParsingError(description: e.toString()));
  });
});

final routeMarkersWithinMapBoundsProvider = FutureProvider.autoDispose
    .family<Either<AppError, List<StopMarker>>, DirectedRoute>(
        (ref, directedRoute) async {
  final allRouteMarkers =
      await ref.watch(AllMarkersByRouteProvider(directedRoute).future);
  final event = await ref.watch(routeMapOnEndEventStreamProvider.future);

  return allRouteMarkers.flatMap((markerList) {
    return catching(() {
      final result = markerList
          .where((marker) => event.bounds.contains(
              LatLng(marker.coordinate.latitude, marker.coordinate.longitude)))
          .where((marker) =>
              marker.routeStops[0].route.canonicalIdentifier ==
              directedRoute.canonicalIdentifier)
          .toList();

      return result;
    }).leftMap((e) => ParsingError(description: e.toString()));
  });
});
