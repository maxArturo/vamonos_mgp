// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:rxdart/transformers.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:async/async.dart';
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
      .read(locationServiceProvider)
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

class MapEventInitialized extends MapEvent {
  MapEventInitialized({required LatLng center, required double zoom})
      : super(
            source: MapEventSource.initialization, zoom: zoom, center: center);
}

class MapEventRecentered extends MapEvent {
  MapEventRecentered({required LatLng center, required double zoom})
      : super(source: MapEventSource.custom, zoom: zoom, center: center);
}

final mapEventStreamProvider =
    StreamProvider.autoDispose<MapEventWithBounds>((ref) async* {
  final mc = await ref.watch(mapControllerServiceProvider.future);
  yield* mc.mapEventStream.map((event) {
    debugPrint(
        "[mapEventStreamProvider] map event yielded of type: ${event.source}");
    return MapEventWithBounds(mc.bounds, event);
  });
});

final onEndMapEvents = MapEventSource.values.where((element) =>
    element == MapEventSource.initialization ||
    element == MapEventSource.custom ||
    element.toString().contains(RegExp(r'(end|End)')));

final mapOnEndEventStreamProvider =
    StreamProvider.autoDispose<MapEventWithBounds>((ref) {
  final res = ref.watch(mapEventStreamProvider.stream);
  final splits = StreamSplitter.splitFrom(res, 2);

  final debouncedStream =
      splits[0].debounceTime(const Duration(milliseconds: 300));
  final customEventsStream = splits[1].where((event) => [
        MapEventSource.initialization,
        MapEventSource.custom
      ].contains(event.source));

  return StreamGroup.merge([debouncedStream, customEventsStream]);
});
