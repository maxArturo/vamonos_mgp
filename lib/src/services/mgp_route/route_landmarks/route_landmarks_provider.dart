import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/adapters/http/http_provider.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_landmark.dart';
import 'package:vamonos_mgp/src/services/mgp_route/route_landmarks/route_landmarks.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'route_landmarks_provider.g.dart';

@Riverpod(keepAlive: true)
RouteLandMarks routeLandmarks(RouteLandmarksRef ref) {
  return RouteLandMarks(ref.watch(httpAdapterProvider));
}

@Riverpod(keepAlive: true)
Future<Either<AppError, List<RouteLandMark>>> routeLandMarksById(
        RouteLandMarksByIdRef ref,
        {required Route route}) =>
    ref.watch(routeLandmarksProvider).getAllRouteLandMarks(route);
