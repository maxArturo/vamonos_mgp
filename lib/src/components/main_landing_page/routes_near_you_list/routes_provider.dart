import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

final routeStopMapMarkersNearYouProvider =
    StreamProvider.autoDispose<Either<AppError, List<List<StopMarker>>>>(
        (AutoDisposeStreamProviderRef ref) async* {
  final stopsWithinBoundsStream =
      ref.watch(markersWithinMapBoundsProvider.stream);
  await for (final latestStops in stopsWithinBoundsStream) {
    yield latestStops.map((markersList) {
      final Map<String, Set<StopMarker>> markersByRoute = {};
      for (final marker in markersList) {
        if (!markersByRoute.containsKey(marker.routeStop.route.name)) {
          markersByRoute[marker.routeStop.route.name] = <StopMarker>{};
        }
        markersByRoute[marker.routeStop.route.name]?.add(marker);
      }
      return markersByRoute.values.map((set) => set.toList()).toList();
    });
  }
});
