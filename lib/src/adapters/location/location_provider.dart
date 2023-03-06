import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/src/adapters/location/location.dart';

final locationAdapterProvider =
    Provider<LocationAdapter>((ref) => LocationAdapter());

final updatedLocationProvider = StreamProvider.autoDispose<LocationData>((ref) {
  return ref.watch(locationAdapterProvider).updateStream();
});
