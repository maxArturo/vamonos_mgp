import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/entities/route.dart' as entity;
import 'package:vamonos_mgp/src/entities/route_landmark.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/services/map/landmark.dart';
import 'package:vamonos_mgp/src/services/mgp_route/route_list/route_list_provider.dart';
import 'package:vamonos_mgp/src/services/mgp_route/route_landmarks/route_landmarks_provider.dart';
import 'package:vamonos_mgp/src/services/mgp_route/route_stops/route_stops_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'landmark_provider.g.dart';

@riverpod
LandmarkService landMarkService(LandMarkServiceRef ref) {
  final routeList = ref.watch(latestRouteListProvider.future);

  routeLandmarksById(entity.Route route) =>
      ref.watch(routeLandMarksByIdProvider(route: route).future);

  routeStopsByRoute(entity.Route route) =>
      ref.watch(routeStopsByRouteProvider(route: route).future);

  return LandmarkService(
    routeStopLandMarksById: routeLandmarksById,
    getAllAvailableRoutes: () => routeList,
    routeStopsByRoute: routeStopsByRoute,
  );
}

@Riverpod(keepAlive: true)
Future<Either<AppError, List<RouteLandMark>>> allLandMarksBySource(
    AllLandMarksBySourceRef ref,
    {required TransportationProvider provider}) {
  debugPrint("[allLandMarksBySourceProvider] INITIALIZED");
  ref.onDispose(() {
    debugPrint("[allLandMarksBySourceProvider] DISPOSED");
  });
  return ref
      .watch(landMarkServiceProvider)
      .allLandMarksByProvider(TransportationProvider.municipioGeneralPurreydon);
}

@riverpod
Future<Either<AppError, List<RouteStop>>> allStopsBySource(
        AllStopsBySourceRef ref,
        {required TransportationProvider provider}) =>
    ref
        .watch(landMarkServiceProvider)
        .allStopsByProvider(TransportationProvider.municipioGeneralPurreydon);
