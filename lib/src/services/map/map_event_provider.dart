import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/transformers.dart';
import 'package:vamonos_mgp/src/entities/map_browser_view.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';

part 'map_event_provider.g.dart';

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

final onEndMapEvents = MapEventSource.values
    .where((element) => element.toString().contains(RegExp(r'(end|End)')));

AutoDisposeStreamProvider<MapEventWithBounds> createMapStreamProvider(
    MapBrowserView view) {
  return StreamProvider.autoDispose<MapEventWithBounds>(
      (AutoDisposeStreamProviderRef ref) async* {
    MapController mc;
    switch (view) {
      case MapBrowserView.stopView:
        mc = await ref.watch((stopViewMapControllerProvider).future);
        break;
      case MapBrowserView.routeView:
        mc = await ref.watch((routeViewMapControllerProvider).future);
        break;
      default:
        throw UnimplementedError();
    }

    // seed initial event
    yield MapEventInitialized(
        bounds: mc.bounds!, zoom: mc.zoom, center: mc.center);

    yield* mc.mapEventStream.map((event) {
      return MapEventWrapped(bounds: mc.bounds!, originalEvent: event);
    });
  });
}

AutoDisposeStreamProvider<MapEventWithBounds> createOnEndMapStreamProvider(
    MapBrowserView view) {
  return StreamProvider.autoDispose((AutoDisposeStreamProviderRef ref) {
    final stream = ref.watch(createMapStreamProvider(view).stream);
    final streamSplitter = StreamSplitter.splitFrom(stream, 2);

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
}

final routeMapEventStreamProvider =
    createOnEndMapStreamProvider(MapBrowserView.routeView);

final stopMapOnEndEventStreamProvider =
    createOnEndMapStreamProvider(MapBrowserView.stopView);

@riverpod
class UnifiedMapEventStream extends _$UnifiedMapEventStream {
  final _controller = StreamController<MapEventWithBounds>.broadcast();

  @override
  Stream<MapEventWithBounds> build() {
    final stopStream = ref.watch(stopMapOnEndEventStreamProvider.stream);
    _controller.sink.addStream(stopStream);
    return _controller.stream;
  }

  get sink => _controller.sink;
}
