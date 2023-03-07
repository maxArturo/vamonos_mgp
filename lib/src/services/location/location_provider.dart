import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../adapters/location/location_provider.dart';

part 'location_provider.g.dart';

@riverpod
class LocationService extends _$LocationService {
  @override
  Future<LocationData> build() async {
    final res = ref.watch(locationAdapterProvider).getLocationData();
    return res;
  }
}
