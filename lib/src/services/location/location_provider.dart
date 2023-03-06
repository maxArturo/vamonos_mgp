import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../adapters/location/location_provider.dart';

part 'location_provider.g.dart';

@riverpod
class LocationService extends _$LocationService {
  @override
  Future<LocationData> build() async {
    // ref.listen(updatedLocationProvider, (previous, next) => state = next);
    final res = ref.watch(locationAdapterProvider).getLocationData();
    debugPrint("got future for loc data");
    return res;
  }
}
