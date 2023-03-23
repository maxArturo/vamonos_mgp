import 'package:concurrent_queue/concurrent_queue.dart';
import 'package:dartz/dartz.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_landmark.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

/// In charge of providing all plotting data
class LandmarkService {
  /// injected function that provides [RouteLandMark]s
  Future<Either<AppError, List<RouteLandMark>>> Function(Route route)
      routeStopLandMarksById;

  /// injected function that provides [RouteStop]s
  Future<Either<AppError, List<RouteStop>>> Function(Route route)
      routeStopsByRoute;

  /// injected function that provides [Route]s
  Future<Either<AppError, List<Route>>> Function() getAllAvailableRoutes;

  LandmarkService({
    required this.routeStopLandMarksById,
    required this.getAllAvailableRoutes,
    required this.routeStopsByRoute,
  });

  final queue = ConcurrentQueue(concurrency: 2);

  /// loops through all routes and pulls stops by each route
  Future<Either<AppError, List<RouteStop>>> allStopsByProvider(
      TransportationProvider provider) async {
    switch (provider) {
      case TransportationProvider.municipioGeneralPurreydon:
        final allRoutes = await getAllAvailableRoutes();
        final allStops = allRoutes.map((routesList) async {
          final stopsByRoute = await queue.addAll(
              routesList.map((r) => () => routeStopsByRoute(r)).toList());

          return stopsByRoute
              .reduce((value, element) => value.flatMap((prev) => element.map(
                    (r) => [...prev, ...r],
                  )));
        });

        return (await allStops.traverseFuture((r) async => (await r)))
            .flatMap((el) => el);
      default:
        throw UnimplementedError();
    }
  }

  Future<Either<AppError, List<RouteStop>>> allStopsByRoute(
      TransportationProvider provider, Route route) async {
    switch (provider) {
      case TransportationProvider.municipioGeneralPurreydon:
        return (await routeStopsByRoute(route));

      default:
        throw UnimplementedError();
    }
  }

  /// Gets all landmarks available, depending on provider implementation
  Future<Either<AppError, List<RouteLandMark>>> allLandMarksByProvider(
      TransportationProvider provider) async {
    switch (provider) {
      case TransportationProvider.municipioGeneralPurreydon:
        final allRoutes = await getAllAvailableRoutes();
        final allLandmarks = allRoutes.map((routesList) async {
          final landmarksByRoute = await queue.addAll(
              routesList.map((r) => () => routeStopLandMarksById(r)).toList());

          return landmarksByRoute
              .reduce((value, element) => value.flatMap((prev) => element.map(
                    (r) => [...prev, ...r],
                  )));
        });

        return (await allLandmarks.traverseFuture((r) async => (await r)))
            .flatMap((el) => el);
      default:
        throw UnimplementedError();
    }
  }

  /// Gets landmarks by provider and route
  Future<Either<AppError, List<RouteLandMark>>> allLandMarksByProviderAndRoute(
      {required TransportationProvider provider, required Route route}) async {
    switch (provider) {
      case TransportationProvider.municipioGeneralPurreydon:
        return await routeStopLandMarksById(route);

      default:
        throw UnimplementedError();
    }
  }
}
