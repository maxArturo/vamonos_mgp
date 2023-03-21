import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/src/adapters/location/location_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

final locationServiceProvider =
    FutureProvider.autoDispose<Either<AppError, LocationData>>(
        (AutoDisposeRef ref) async {
  return await ref.watch(locationAdapterProvider).getLocationData();
});

final updatedLocationServiceProvider =
    StreamProvider.autoDispose<Either<AppError, LocationData>>(
        (AutoDisposeRef ref) async* {
  yield await ref.watch(locationServiceProvider.future);
  yield* ref.watch(updatedLocationProvider.stream).map((event) => Right(event));
});
