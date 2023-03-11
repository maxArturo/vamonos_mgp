import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/adapters/http/http_provider.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/services/mgp_route/route_stops/route_stops.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'route_stops_provider.g.dart';

@riverpod
RouteStopService routeStops(RouteStopsRef ref) {
  return RouteStopService(ref.watch(httpAdapterProvider));
}

@riverpod
Future<Either<AppError, List<RouteStop>>> routeStopsByRoute(
        RouteStopsByRouteRef ref,
        {required Route route}) =>
    ref.watch(routeStopsProvider).getAllRouteStops(route);
