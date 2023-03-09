import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/services/location/location_provider.dart';

part 'map_controller_provider.g.dart';

@riverpod
class MapControllerService extends _$MapControllerService {
  @override
  Future<MapController> build() {
    return ref
        .watch(locationServiceProvider.future)
        .then((value) => MapController());
  }

  recenterMapLocation() => ref
      .watch(locationServiceProvider)
      .whenData((value) => updateMapLocation(value));

  updateMapLocation(LocationData location) {
    state.whenData((value) => value.moveAndRotate(
        LatLng(location.latitude!, location.longitude!), 17, 0));
  }
}

class MapEventWithBounds extends MapEvent {
  final LatLngBounds? bounds;

  MapEventWithBounds(this.bounds, MapEvent event)
      : super(source: event.source, center: event.center, zoom: event.zoom);
}

final mapEventStreamProvider =
    StreamProvider.autoDispose<MapEventWithBounds>((ref) async* {
  final mc = await ref.watch(mapControllerServiceProvider.future);
  yield* mc.mapEventStream.map((event) => MapEventWithBounds(mc.bounds, event));
});

// @riverpod
// Stream<MapEventWithBounds?> mapEventStream(MapEventStreamRef ref) async* {
//   final mc = await ref.watch(mapControllerServiceProvider.future);
//   yield* mc.mapEventStream.map((event) => MapEventWithBounds(mc.bounds, event));
// }
