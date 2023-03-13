import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/adapters/http/http_provider.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/entities/stop_arrival.dart';
import 'package:vamonos_mgp/src/services/mgp_route/stop_arrivals/stop_arrivals.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'stop_arrivals_provider.g.dart';

@riverpod
StopArrivalService stopArrivals(StopArrivalsRef ref) {
  return StopArrivalService(ref.watch(httpAdapterProvider));
}

@riverpod
Future<Either<AppError, List<StopArrival>>> stopArrivalsByStop(
        StopArrivalsByStopRef ref,
        {required RouteStop stop}) =>
    ref.watch(stopArrivalsProvider).getAllStopArrivals(stop);
