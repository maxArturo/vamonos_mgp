import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../location/location_provider.dart';

part 'map_controller_provider.g.dart';

@riverpod
class MapControllerService extends _$MapControllerService {
  @override
  Future<MapController> build() {
    return ref
        .read(locationServiceProvider.future)
        .then((value) => MapController());
  }

  recenterMapLocation() => ref
      .read(locationServiceProvider)
      .whenData((value) => updateMapLocation(value));

  updateMapLocation(LocationData location) {
    state.whenData((value) => value.moveAndRotate(
        LatLng(location.latitude!, location.longitude!), 17, 0));
  }
}
