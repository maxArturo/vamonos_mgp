import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_stop_landmark.dart';
import 'package:vamonos_mgp/src/services/map/stops_within_bounds_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

final routesNearYouProvider =
    StreamProvider.autoDispose<Either<AppError, List<DirectedRoute>>>(
        (AutoDisposeRef ref) async* {
  final stopsWithinBoundsStream = ref.watch(stopsWithinMapBoundsProvider);
  await for (final latestStops in stopsWithinBoundsStream) {
    yield latestStops.flatMap((stopsList) {
      final Map<String, Set<RouteStopLandMark>> stopsByRoute = {};
      for (final stop in stopsList) {
        if (!stopsByRoute.containsKey(stop.route.direction)) {
          stopsByRoute[stop.route.direction] = <RouteStopLandMark>{};
        }
        stopsByRoute[stop.route.direction]?.add(stop);
      }

      return latestStops.map((stops) {
        return stopsByRoute.keys
            .map((key) => stopsByRoute[key]!.first.route)
            .toList();
      });
    });
  }
});
