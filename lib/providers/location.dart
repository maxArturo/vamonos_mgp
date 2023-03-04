import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../adapters/location.dart';

part 'location.g.dart';

@riverpod
class GpsLocation extends _$GpsLocation {
  @override
  FutureOr<LocationData> build() async {
    return getLocationData();
  }

  refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await getLocationData();
    });
  }
}
