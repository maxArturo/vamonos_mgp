import 'package:dartz/dartz.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_landmark.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

class LandmarkSourceConfig {
  final TransportationProvider provider;

  Future<Either<AppError, List<RouteLandMark>>> Function(Route route)
      routeLandMarksByRoute;

  Future<Either<AppError, List<RouteStop>>> Function(Route route)
      routeStopsByRoute;

  Future<Either<AppError, List<Route>>> Function() getAllAvailableRoutes;

  LandmarkSourceConfig(
      {required this.provider,
      required this.getAllAvailableRoutes,
      required this.routeLandMarksByRoute,
      required this.routeStopsByRoute});
}
