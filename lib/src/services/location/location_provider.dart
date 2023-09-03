import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/adapters/location/location_provider.dart';
import 'package:vamonos_mgp/src/entities/coordinates.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

final locationServiceProvider =
    FutureProvider.autoDispose<Either<AppError, Coordinate>>(
        (AutoDisposeRef ref) async {
  return await ref.watch(locationAdapterProvider).getLocationData();
});

final updatedLocationServiceProvider =
    StreamProvider.autoDispose<Either<AppError, Coordinate>>(
        (AutoDisposeRef ref) async* {
  yield await ref.watch(locationServiceProvider.future);
  yield* ref.watch(updatedLocationProvider.stream).map((event) => Right(event));
});
