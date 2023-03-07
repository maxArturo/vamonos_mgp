import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/adapters/http/http_provider.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_stop_landmark.dart';
import 'package:vamonos_mgp/src/services/mgp_route/route_stop_landmarks/route_stop_landmarks.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'route_stop_landmarks_provider.g.dart';

@riverpod
RouteStopLandMarks routeStopLandmarks(RouteStopLandmarksRef ref) {
  return RouteStopLandMarks(ref.watch(httpAdapterProvider));
}

@riverpod
Future<Either<AppError, List<RouteStopLandMark>>> routeStopLandMarksById(
        RouteStopLandMarksByIdRef ref,
        {required Route route}) =>
    ref.watch(routeStopLandmarksProvider).getAllStopLocations(route);
