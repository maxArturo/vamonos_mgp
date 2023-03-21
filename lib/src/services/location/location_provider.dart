import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/src/adapters/location/location_provider.dart';

final locationServiceProvider =
    FutureProvider.autoDispose<LocationData>((AutoDisposeRef ref) async {
  return await ref.watch(locationAdapterProvider).getLocationData();
});

final updatedLocationServiceProvider =
    StreamProvider.autoDispose<LocationData>((AutoDisposeRef ref) async* {
  yield await ref.watch(locationServiceProvider.future);
  yield* ref.watch(updatedLocationProvider.stream);
});
