import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/models.dart';
import 'package:vamonos_mgp/src/entities/coordinates.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';
import 'package:vamonos_mgp/src/services/map/stops_within_bounds_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

/// uses the map bounds to collect set of available routes, sorted by proximity
/// to map center.
final visibleRoutesCardProvider =
    StreamProvider.autoDispose<Either<AppError, List<RouteCardData>>>(
        (AutoDisposeStreamProviderRef ref) async* {
  final mapController = await ref.watch(stopViewMapControllerProvider.future);

  final stopsWithinBoundsStream = ref.watch(stopsWithinMapBoundsProvider(
      provider: TransportationProvider.municipioGeneralPurreydon));

  await for (final latestStops in stopsWithinBoundsStream) {
    yield latestStops.map((stopsList) {
      final mapCenter = Coordinate(
          latitude: mapController.center.latitude,
          longitude: mapController.center.longitude);

      final SplayTreeMap<String, RouteStop> closestStopByDirectedRoute =
          SplayTreeMap();

      for (final stop in stopsList) {
        final currStopRoute = stop.route;
        if (!closestStopByDirectedRoute
            .containsKey(currStopRoute.canonicalIdentifier)) {
          closestStopByDirectedRoute[currStopRoute.canonicalIdentifier] = stop;
        } else {
          final currClosestCoordinates =
              closestStopByDirectedRoute[currStopRoute.canonicalIdentifier]!
                  .location;
          if (currClosestCoordinates.distanceTo(mapCenter) >
              stop.location.distanceTo(mapCenter)) {
            closestStopByDirectedRoute[currStopRoute.canonicalIdentifier] =
                stop;
          }
        }
      }

      /// group route stops by route (as there could be several directions per
      /// route)
      final Map<String, List<RouteStop>> result = {};
      for (final routeStop in closestStopByDirectedRoute.values) {
        if (!result.containsKey(routeStop.route.name)) {
          result[routeStop.route.name] = [routeStop];
        } else {
          result[routeStop.route.name]!.add(routeStop);
        }
      }

      return result.entries
          .map((e) => RouteCardData(
              routeName: e.key, closestStopsByUniqueDirection: e.value))
          .toList();
    });
  }
});
