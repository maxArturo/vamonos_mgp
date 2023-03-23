import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_landmark.dart';
import 'package:vamonos_mgp/src/services/mgp_route/route_landmarks/route_landmarks_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'directed_route_landmarks_provider.g.dart';

@riverpod
Stream<Either<AppError, List<RouteLandMark>>> directedRouteVisibleLandmarks(
    DirectedRouteVisibleLandmarksRef ref,
    {required DirectedRoute directedRoute}) async* {
  // TODO work herer
  final allMarkers =
      await ref.watch(RouteLandMarksByIdProvider(route: directedRoute).future);
}
