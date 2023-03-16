// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/transformers.dart';
import 'package:vamonos_mgp/src/services/location/location_provider.dart';

part 'map_controller_provider.g.dart';

@Riverpod(keepAlive: true)
class MapControllerService extends _$MapControllerService {
  final _mapInitializer = Completer<MapController>();

  @override
  Future<MapController> build() {
    return _mapInitializer.future;
  }

  initialize(MapController mc) {
    debugPrint(
        "[MapControllerService]: map initializer completed? ${_mapInitializer.isCompleted}");
    if (!_mapInitializer.isCompleted) {
      _mapInitializer.complete(mc);
      mc.mapEventStream.listen((event) {
        debugPrint(
            "[MapControllerService]: RAW LISTENER FIRED with event type ${event.runtimeType} and source ${event.source}");
      });
    }

    debugPrint(
        "[MapControllerService]: adding initialization event from scratch");
    mc.mapEventSink.add(MapEventInitialized(
        bounds: mc.bounds!, zoom: mc.zoom, center: mc.center));

    return mc;
  }

  recenterMapLocation() => ref
      .read(updatedLocationServiceProvider)
      .whenData((value) => updateMapLocation(value));

  updateMapLocation(LocationData location) {
    state.whenData((value) => value.moveAndRotate(
        LatLng(location.latitude!, location.longitude!), 17, 0));
  }
}

enum AppMapEventSource { initialized, recentered, external }

class MapEventWithBounds implements MapEvent {
  @override
  final LatLng center;
  @override
  final double zoom;

  final LatLngBounds bounds;
  final MapEvent? originalEvent;
  final AppMapEventSource eventSource;

  MapEventWithBounds(
      {required this.bounds,
      required this.center,
      required this.zoom,
      required this.eventSource,
      this.originalEvent});

  @override
  MapEventSource get source => originalEvent?.source ?? MapEventSource.custom;
}

class MapEventInitialized extends MapEventWithBounds {
  MapEventInitialized(
      {required super.bounds, required super.zoom, required super.center})
      : super(eventSource: AppMapEventSource.initialized);
}

class MapEventRecentered extends MapEventWithBounds {
  MapEventRecentered(
      {required super.bounds, required super.zoom, required super.center})
      : super(eventSource: AppMapEventSource.recentered);
}

class MapEventWrapped extends MapEventWithBounds {
  MapEventWrapped({required MapEvent originalEvent, required super.bounds})
      : super(
            center: originalEvent.center,
            originalEvent: originalEvent,
            zoom: originalEvent.zoom,
            eventSource: AppMapEventSource.external);
}

final mapEventStreamProvider =
    StreamProvider<MapEventWithBounds>((StreamProviderRef ref) async* {
  debugPrint("[mapEventStreamProvider] INITALIZED");
  final mc = await ref.watch(mapControllerServiceProvider.future);

  ref.onDispose(() {
    debugPrint("[mapEventStreamProvider] DISPOSED ");
  });

  // seed initial event
  yield MapEventInitialized(
      bounds: mc.bounds!, zoom: mc.zoom, center: mc.center);

  yield* mc.mapEventStream.map((event) {
    debugPrint(
        "[mapEventStreamProvider] yielding raw original map event: ${event.runtimeType} and source: ${event.source}");
    return MapEventWrapped(bounds: mc.bounds!, originalEvent: event);
  });
});

final onEndMapEvents = MapEventSource.values
    .where((element) => element.toString().contains(RegExp(r'(end|End)')));

final mapOnEndEventStreamProvider =
    StreamProvider.autoDispose<MapEventWithBounds>((ref) {
  final originalStream = ref.watch(mapEventStreamProvider.stream);

  final streamSplitter = StreamSplitter.splitFrom(originalStream, 2);

  final debouncedStream = streamSplitter[0]
      .where((event) =>
          event.eventSource == AppMapEventSource.external &&
          event.originalEvent!.source != MapEventSource.custom)
      .debounceTime(const Duration(milliseconds: 300))
      .map((event) {
    debugPrint(
        "[debouncedStream] yielding on event source: ${event.eventSource} and type: ${event.source}");
    return event;
  });
  final appEventsStream = streamSplitter[1]
      .where((event) => event.eventSource != AppMapEventSource.external)
      .map(
    (event) {
      debugPrint(
          "[appEventsStream] yielding on event source: ${event.eventSource} and type: ${event.source}");
      return event;
    },
  );

  return StreamGroup.merge([debouncedStream, appEventsStream]);
});
