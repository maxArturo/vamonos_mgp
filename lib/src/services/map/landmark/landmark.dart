import 'package:concurrent_queue/concurrent_queue.dart';
import 'package:dartz/dartz.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_landmark.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/services/map/landmark/landmark_config.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

/// In charge of providing all plotting data
class LandmarkService {
  Map<TransportationProvider, LandmarkSourceConfig> sources;
  LandmarkService({
    required this.sources,
  });

  final queue = ConcurrentQueue(concurrency: 2);

  void ensureContainsProvider(TransportationProvider provider) {
    if (!sources.containsKey(provider)) {
      throw UnimplementedError();
    }
  }

  /// loops through all routes and pulls stops by each route
  Future<Either<AppError, List<RouteStop>>> allStopsByProvider(
      TransportationProvider provider) async {
    ensureContainsProvider(provider);

    final allRoutes = await sources[provider]!.getAllAvailableRoutes();
    final allStops = allRoutes.map((routesList) async {
      final stopsByRoute = await queue.addAll(routesList
          .map((r) => () => sources[provider]!.routeStopsByRoute(r))
          .toList());

      return stopsByRoute
          .reduce((value, element) => value.flatMap((prev) => element.map(
                (r) => [...prev, ...r],
              )));
    });

    return (await allStops.traverseFuture((r) async => (await r)))
        .flatMap((el) => el);
  }

  Future<Either<AppError, List<RouteStop>>> allStopsByRoute(
      TransportationProvider provider, Route route) async {
    ensureContainsProvider(provider);
    return (await sources[provider]!.routeStopsByRoute(route));
  }

  /// Gets all landmarks available, depending on provider implementation
  Future<Either<AppError, List<RouteLandMark>>> allLandMarksByProvider(
      TransportationProvider provider) async {
    ensureContainsProvider(provider);
    final allRoutes = await sources[provider]!.getAllAvailableRoutes();
    final allLandmarks = allRoutes.map((routesList) async {
      final landmarksByRoute = await queue.addAll(routesList
          .map((r) => () => sources[provider]!.routeLandMarksByRoute(r))
          .toList());

      return landmarksByRoute
          .reduce((value, element) => value.flatMap((prev) => element.map(
                (r) => [...prev, ...r],
              )));
    });

    return (await allLandmarks.traverseFuture((r) async => (await r)))
        .flatMap((el) => el);
  }

  /// Gets landmarks by provider and route
  Future<Either<AppError, List<RouteLandMark>>> allLandMarksByProviderAndRoute(
      {required TransportationProvider provider, required Route route}) async {
    ensureContainsProvider(provider);
    return await sources[provider]!.routeLandMarksByRoute(route);
  }
}
