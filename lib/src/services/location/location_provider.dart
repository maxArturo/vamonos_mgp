import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/adapters/location/location_provider.dart';
import 'package:vamonos_mgp/src/entities/coordinate.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

final locationServiceProvider =
    FutureProvider.autoDispose<Either<AppError, Coordinate>>(
        (AutoDisposeRef ref) async {
  return await ref.watch(locationAdapterProvider).getLocationData();
});

final updatedLocationServiceProvider =
    FutureProvider.autoDispose<Either<AppError, Coordinate>>((ref) async {
  final res = await ref.watch(updatedLocationProvider.future);
  return Right(res);
});
