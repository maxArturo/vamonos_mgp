import 'package:concurrent_queue/concurrent_queue.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/adapters/http/http_provider.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/entities/stop_arrival.dart';
import 'package:vamonos_mgp/src/services/mgp_route/stop_arrivals/stop_arrivals.dart';
import 'package:vamonos_mgp/src/util/config_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'stop_arrivals_provider.g.dart';

@riverpod
StopArrivalService stopArrivals(StopArrivalsRef ref) {
  return StopArrivalService(
      ref.watch(httpAdapterProvider), ref.watch(configProvider).mgpApiUrl);
}

@riverpod
Future<Either<AppError, List<StopArrival>>> stopArrivalsByStop(
        StopArrivalsByStopRef ref,
        {required RouteStop stop}) =>
    ref.watch(stopArrivalsProvider).getAllStopArrivals(stop);

@riverpod
Future<Either<AppError, Map<RouteStop, List<StopArrival>>>>
    stopArrivalsByMarker(StopArrivalsByMarkerRef ref, StopMarker marker) async {
  final queue = ConcurrentQueue(concurrency: 2);

  final allFutures = marker.routeStops
      .map((stop) => () async {
            return (await ref
                    .watch(stopArrivalsByStopProvider(stop: stop).future))
                .map((arrivals) => MapEntry(stop, arrivals));
          })
      .toList();

  final resolvedFutures = await queue.addAll(allFutures);
  return resolvedFutures
      .fold<Either<AppError, Map<RouteStop, List<StopArrival>>>>(
          const Right({}),
          ((previousValue, element) =>
              previousValue.flatMap((map) => element.map((entry) {
                    map.addEntries([entry]);
                    return map;
                  }))));
}
