import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/adapters/http/http_provider.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/entities/stop_arrival.dart';
import 'package:vamonos_mgp/src/services/map/markers/marker.dart';
import 'package:vamonos_mgp/src/services/mgp_route/stop_arrivals/stop_arrivals.dart';
import 'package:vamonos_mgp/src/services/route_stop_provider.dart';
import 'package:vamonos_mgp/src/util/config_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'stop_arrivals_provider.g.dart';

@riverpod
StopArrivalService stopArrivals(StopArrivalsRef ref) {
  return StopArrivalService(
      ref.watch(httpAdapterProvider), ref.watch(configProvider).mgpApiUrl);
}

@riverpod
Future<Either<AppError, List<StopArrival>>> arrivalsByStop(
        ArrivalsByStopRef ref,
        {required RouteStop stop}) =>
    ref.watch(stopArrivalsProvider).getAllStopArrivals(stop);

@riverpod
Future<Either<AppError, List<StopArrival>>> arrivalsByMarker(
    ArrivalsByMarkerRef ref,
    {required StopMarker marker}) async {
  final routeStop =
      await ref.watch(findRouteStopByMarkerMGPProvider(marker).future);

  final foldedArrival = routeStop.map((stop) {
    return ref.watch(arrivalsByStopProvider(stop: stop).future);
  });

  return (await foldedArrival.traverseFuture((r) async => (await r)))
      .flatMap((a) => a);
}
