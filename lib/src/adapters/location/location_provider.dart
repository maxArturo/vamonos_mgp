import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/adapters/location/location.dart';
import 'package:vamonos_mgp/src/entities/coordinate.dart';

final locationAdapterProvider =
    Provider<LocationAdapter>((ref) => LocationAdapter());

final updatedLocationProvider = StreamProvider.autoDispose<Coordinate>((ref) {
  return ref.watch(locationAdapterProvider).updateStream;
});
