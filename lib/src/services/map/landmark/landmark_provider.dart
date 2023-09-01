import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_landmark.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/services/map/landmark/landmark.dart';
import 'package:vamonos_mgp/src/services/map/landmark/landmark_config.dart';
import 'package:vamonos_mgp/src/services/mgp_route/route_landmarks/route_landmarks_provider.dart'
    as mgp_route_landmarks_source;
import 'package:vamonos_mgp/src/services/mgp_route/route_list/route_list_provider.dart'
    as mgp_route_list_source;
import 'package:vamonos_mgp/src/services/mgp_route/route_stops/route_stops_provider.dart'
    as mgp_route_stops_source;
import 'package:vamonos_mgp/src/util/errors.dart';

part 'landmark_provider.g.dart';

@riverpod
LandmarkService landMarkService(LandMarkServiceRef ref) {
  final routeList =
      ref.watch(mgp_route_list_source.latestRouteListProvider.future);

  return LandmarkService(sources: {
    TransportationProvider.municipioGeneralPurreydon: LandmarkSourceConfig(
      provider: TransportationProvider.municipioGeneralPurreydon,
      routeLandMarksByRoute: (Route route) => ref.watch(
          mgp_route_landmarks_source.RouteLandMarksByIdProvider(route: route)
              .future),
      getAllAvailableRoutes: () => routeList,
      routeStopsByRoute: (Route route) => ref.watch(mgp_route_stops_source
          .routeStopsByRouteProvider(route: route)
          .future),
    )
  });
}

@riverpod
Future<Either<AppError, List<RouteLandMark>>> allLandMarks(AllLandMarksRef ref,
    {required TransportationProvider provider}) {
  return ref.watch(landMarkServiceProvider).allLandMarksByProvider(provider);
}

@riverpod
Future<Either<AppError, List<RouteStop>>> allStops(AllStopsRef ref,
        {required TransportationProvider provider}) =>
    ref.watch(landMarkServiceProvider).allStopsByProvider(provider);

@riverpod
Future<Either<AppError, Map<int, RouteStop>>> stopsStoreBySource(
        StopsStoreBySourceRef ref,
        {required TransportationProvider provider}) async =>
    (await ref.watch(allStopsProvider(provider: provider).future))
        .flatMap((routeStops) => Right(routeStops.asMap()));

@riverpod
Future<Either<AppError, Map<int, RouteStop>>> stopsStoreByRoute(
        StopsStoreByRouteRef ref,
        {required TransportationProvider provider,
        required Route route}) async =>
    (await ref.watch(landMarkServiceProvider).allStopsByRoute(provider, route))
        .flatMap((routeStops) => Right(routeStops.asMap()));

@riverpod
Future<Either<AppError, List<RouteLandMark>>> allLandmarksByRoute(
        AllLandmarksByRouteRef ref,
        {required TransportationProvider provider,
        required Route route}) =>
    ref
        .watch(landMarkServiceProvider)
        .allLandMarksByProviderAndRoute(provider: provider, route: route);
