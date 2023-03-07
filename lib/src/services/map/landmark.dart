import 'package:concurrent_queue/concurrent_queue.dart';
import 'package:dartz/dartz.dart';
import 'package:quiver/iterables.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_stop_landmark.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

/// generate landmarks for map plotting by demand
/// or all at once for a given set of routes
class LandmarkService {
  Future<Either<AppError, List<RouteStopLandMark>>> Function(Route route)
      routeStopLandMarksById;
  Future<Either<AppError, List<Route>>> Function() getAllAvailableRoutes;

  LandmarkService(
      {required this.routeStopLandMarksById,
      required this.getAllAvailableRoutes});

  final queue = ConcurrentQueue(concurrency: 2);

  /// Gets all landmarks available, depending on provider implementation
  Future<Either<AppError, List<RouteStopLandMark>>> allLandMarksByProvider(
      TransportationProvider provider) async {
    switch (provider) {
      case TransportationProvider.municipioGeneralPurreydon:
        final allRoutes = await getAllAvailableRoutes();
        final allLandmarks = allRoutes.map((routesList) async {
          final landmarksByRoute = await queue.addAll(
              routesList.map((r) => () => routeStopLandMarksById(r)).toList());

          final res = landmarksByRoute
              .reduce((value, element) => value.flatMap((prev) => element.map(
                    (r) => [...prev, ...r],
                  )));
          return res;

          // final chunks = partition(routesList, 3);
          // final futures = chunks.map(
          //     (chunk) => chunk.map((route) => routeStopLandMarksById(route)));

          // Either<AppError, List<RouteStopLandMark>> result = const Right([]);

          // for (final chunk in futures) {
          //   final routeLandmarkData = await Future.wait(chunk);
          //   final reduced = routeLandmarkData.reduce((value, element) =>
          //       value.flatMap((currentLandmarks) => element.map(
          //             (newLandmarks) => [...newLandmarks, ...currentLandmarks],
          //           )));

          //   result = result.flatMap((landmarksList) =>
          //       reduced.map((r) => [...r, ...landmarksList]));
          // }

          // return result;
        });

        return (await allLandmarks.traverseFuture((r) async => (await r)))
            .flatMap((el) => el);
      default:
        throw UnimplementedError();
    }
  }
}
