import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/services/map/landmark/landmark_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_event_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'markers_provider.g.dart';

routeStopsToMarkers(Either<AppError, Map<int, RouteStop>> routeStops) =>
    routeStops.flatMap<List<StopMarker>>((stops) {
      try {
        final stopMarkers = stops.entries
            .where((el) =>
                el.value.location.latitude != null &&
                el.value.location.longitude != null &&
                el.value.isStoppingPoint)
            .map((entry) => StopMarker.makeStop(
                routeStop: entry.value, hashCode: entry.key))
            .toList();

        return Right(stopMarkers);
      } catch (e) {
        return Left(ParsingError());
      }
    });

@riverpod
Future<Either<AppError, List<StopMarker>>> allMarkersMGP(
    AllMarkersMGPRef ref) async {
  final routeStore = await ref.watch(stopsStoreBySourceProvider(
          provider: TransportationProvider.municipioGeneralPurreydon)
      .future);

  return routeStopsToMarkers(routeStore);
}

@riverpod
Future<Either<AppError, List<StopMarker>>> allMarkersByRouteMGP(
    AllMarkersByRouteMGPRef ref, DirectedRoute directedRoute) async {
  final routeStore = await ref.watch(stopsStoreByRouteProvider(
          provider: TransportationProvider.municipioGeneralPurreydon,
          route: directedRoute)
      .future);

  return routeStopsToMarkers(routeStore);
}

Either<AppError, List<StopMarker>> filterStopsByEventBoundary(
        {required MapEventWithBounds event,
        required Map<int, RouteStop> routeStopStore,
        required List<StopMarker> markerList}) =>
    catching(() => markerList
        .where((marker) => event.bounds.contains(marker.point))
        .where((marker) =>
            (routeStopStore[marker.routeStopHashCode])?.isStoppingPoint ??
            false)
        .toList()).leftMap((e) => ParsingError(description: e.toString()));

final markersWithinMapBoundsMGPProvider =
    StreamProvider.autoDispose<Either<AppError, List<StopMarker>>>(
        (AutoDisposeRef ref) async* {
  final allMarkers = await ref.watch(allMarkersMGPProvider.future);
  final stopStore = await ref.watch(stopsStoreBySourceProvider(
          provider: TransportationProvider.municipioGeneralPurreydon)
      .future);
  final mapEventStream = ref.watch(stopMapOnEndEventStreamProvider.stream);

  await for (final event in mapEventStream) {
    yield stopStore.flatMap((store) => allMarkers.flatMap((markerList) {
          return filterStopsByEventBoundary(
              event: event, routeStopStore: store, markerList: markerList);
        }));
  }
});

final routeMarkersWithinMapBoundsMGPProvider = StreamProvider.autoDispose
    .family<Either<AppError, List<StopMarker>>, DirectedRoute>(
        (ref, directedRoute) async* {
  final allRouteMarkers =
      await ref.watch(AllMarkersByRouteMGPProvider(directedRoute).future);
  final stopStore = await ref.watch(stopsStoreByRouteProvider(
          provider: TransportationProvider.municipioGeneralPurreydon,
          route: directedRoute)
      .future);
  final mapEventStream = ref.watch(routeMapOnEndEventStreamProvider.stream);
  await for (final event in mapEventStream) {
    yield stopStore.flatMap((store) => allRouteMarkers.flatMap((markerList) {
          return filterStopsByEventBoundary(
              event: event, routeStopStore: store, markerList: markerList);
        }));
  }
});
