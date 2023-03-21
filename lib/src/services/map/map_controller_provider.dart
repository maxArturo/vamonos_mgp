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

abstract class BaseMapController extends AsyncNotifier<MapController> {}

mixin MapFunctionality on AsyncNotifier<MapController> {
  final _mapInitializer = Completer<MapController>();
  @override
  Future<MapController> build() {
    return _mapInitializer.future;
  }

  initialize(MapController mc) {
    state = const AsyncLoading();
    debugPrint(
        "[MapControllerService]: map initializer completed? ${_mapInitializer.isCompleted}");
    if (!_mapInitializer.isCompleted) {
      _mapInitializer.complete(mc);
    } else {
      state = AsyncData(mc);
    }

    mc.mapEventSink.add(MapEventInitialized(
        bounds: mc.bounds!, zoom: mc.zoom, center: mc.center));

    return mc;
  }

  get initialized => _mapInitializer.isCompleted;

  recenterMapLocation() => ref
      .read(updatedLocationServiceProvider)
      .whenData((value) => value.map((el) => updateMapLocation(el)));

  void updateMapLocation(LocationData location) {
    state.whenData((controller) {
      controller.moveAndRotate(
          LatLng(location.latitude!, location.longitude!), 17, 0);
      controller.mapEventSink.add(MapEventInitialized(
          bounds: controller.bounds!,
          zoom: controller.zoom,
          center: controller.center));
    });
  }
}

@Riverpod(keepAlive: true)
class StopViewMapController extends _$StopViewMapController
    with MapFunctionality {
  /// override is needed because of riverpod generator
  @override
  Future<MapController> build() {
    return _mapInitializer.future;
  }
}

@Riverpod(keepAlive: true)
class RouteViewMapController extends _$RouteViewMapController
    with MapFunctionality {
  /// override is needed because of riverpod generator
  @override
  Future<MapController> build() {
    return _mapInitializer.future;
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

final mapEventStreamProvider = StreamProvider.autoDispose<MapEventWithBounds>(
    (AutoDisposeStreamProviderRef ref) async* {
  final mc = await ref.watch(stopViewMapControllerProvider.future);

  // seed initial event
  yield MapEventInitialized(
      bounds: mc.bounds!, zoom: mc.zoom, center: mc.center);

  yield* mc.mapEventStream.map((event) {
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
