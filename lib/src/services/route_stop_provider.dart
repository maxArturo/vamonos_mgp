import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/services/map/landmark/landmark_provider.dart';
import 'package:vamonos_mgp/src/services/map/markers/marker.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'route_stop_provider.g.dart';

@riverpod
Future<Either<AppError, RouteStop>> findRouteStopByMarkerMGP(
    FindRouteStopByMarkerMGPRef ref, StopMarker marker) async {
  final routeStore = await ref.watch(stopsStoreBySourceProvider(
          provider: TransportationProvider.municipioGeneralPurreydon)
      .future);

  return routeStore.flatMap((store) {
    if (store.containsKey(marker.routeStopHashCode)) {
      return Right(store[marker.routeStopHashCode]!);
    }
    return Left(UntypedError(
        description:
            "could not find route stop for marker by id: ${marker.routeStopHashCode}"));
  });
}
