import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_stop_landmark.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/services/map/landmark.dart';
import 'package:vamonos_mgp/src/services/mgp_route/route_list/route_list_provider.dart';
import 'package:vamonos_mgp/src/services/mgp_route/route_stop_landmarks/route_stop_landmarks_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'landmark_provider.g.dart';

@riverpod
LandmarkService landMarkService(LandMarkServiceRef ref) {
  final routeList = ref.watch(latestRouteListProvider.future);

  routeStopLandmarksById(Route route) =>
      ref.watch(routeStopLandMarksByIdProvider(route: route).future);

  return LandmarkService(
    routeStopLandMarksById: routeStopLandmarksById,
    getAllAvailableRoutes: () => routeList,
  );
}

@riverpod
Future<Either<AppError, List<RouteStopLandMark>>> allLandMarksBySource(
        AllLandMarksBySourceRef ref,
        {required TransportationProvider provider}) =>
    ref.watch(landMarkServiceProvider).allLandMarksByProvider(
        TransportationProvider.municipioGeneralPurreydon);
