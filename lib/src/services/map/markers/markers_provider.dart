import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/services/map/landmark/landmark_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_event_provider.dart';
import 'package:vamonos_mgp/src/services/map/markers/marker.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'markers_provider.g.dart';

/// helper function to render out map markers from route stops
routeStopsToMarkerStore(Either<AppError, Map<int, RouteStop>> routeStops) =>
    routeStops.flatMap<Map<RouteStop, StopMarker>>((stops) {
      try {
        final markerStore = Map.fromEntries(stops.entries.map((entry) =>
            MapEntry(
                entry.value,
                StopMarker.makeStop(
                    routeStop: entry.value, hashCode: entry.key))));

        return Right(markerStore);
      } catch (e) {
        return Left(ParsingError());
      }
    });

@riverpod
Future<Either<AppError, Map<RouteStop, StopMarker>>> markersMGPStore(
    MarkersMGPStoreRef ref) async {
  final routeStore = await ref.watch(stopsStoreBySourceProvider(
          provider: TransportationProvider.municipioGeneralPurreydon)
      .future);

  return routeStopsToMarkerStore(routeStore);
}

@riverpod
Future<Either<AppError, List<StopMarker>>> allMarkersMGP(
    AllMarkersMGPRef ref) async {
  final markerStore = await ref.watch(markersMGPStoreProvider.future);

  return markerStore.map((store) => store.values.toList());
}

@riverpod
Future<Either<AppError, List<StopMarker>>> allMarkersByRouteMGP(
    AllMarkersByRouteMGPRef ref, DirectedRoute directedRoute) async {
  final routeStore = await ref.watch(stopsStoreByRouteProvider(
          provider: TransportationProvider.municipioGeneralPurreydon,
          route: directedRoute)
      .future);

  return routeStopsToMarkerStore(routeStore);
}

Either<AppError, List<StopMarker>> getVisibleMarkers(
    {required MapEventWithBounds event, required List<StopMarker> markerList}) {
  return catching(() => markerList
      .where((marker) => event.bounds.contains(marker.point))
      .toList()).leftMap((e) => ParsingError(description: e.toString()));
}

final markersWithinMapBoundsMGPProvider =
    StreamProvider.autoDispose<Either<AppError, List<StopMarker>>>(
        (AutoDisposeRef ref) async* {
  final allMarkers = await ref.watch(allMarkersMGPProvider.future);
  final mapEventStream = ref.watch(stopMapOnEndEventStreamProvider.stream);

  await for (final event in mapEventStream) {
    allMarkers.flatMap((markerList) {
      return getVisibleMarkers(event: event, markerList: markerList);
    });
  }
});

final routeMarkersWithinMapBoundsMGPProvider = StreamProvider.autoDispose
    .family<Either<AppError, List<StopMarker>>, DirectedRoute>(
        (ref, directedRoute) async* {
  final allRouteMarkers =
      await ref.watch(AllMarkersByRouteMGPProvider(directedRoute).future);
  final mapEventStream = ref.watch(routeMapOnEndEventStreamProvider.stream);
  await for (final event in mapEventStream) {
    yield allRouteMarkers.flatMap((markerList) =>
        getVisibleMarkers(event: event, markerList: markerList));
  }
});
