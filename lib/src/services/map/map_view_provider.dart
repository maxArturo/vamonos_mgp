import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/entities/map_browser_view.dart';
import 'package:vamonos_mgp/src/entities/route_map_options_model.dart';

part 'map_view_provider.g.dart';

@riverpod
class MapView extends _$MapView {
  @override
  MapBrowserView build() {
    return MapBrowserView.stopView;
  }

  void setRouteView() {
    debugPrint("[$runtimeType] set state to route");
    state = MapBrowserView.routeView;
  }

  void setStopView() {
    debugPrint("[$runtimeType] set state to stop");
    state = MapBrowserView.stopView;
  }
}

@riverpod
class RouteMapViewState extends _$RouteMapViewState {
  @override
  RouteMapState build() {
    return const RouteMapState();
  }

  void toggleAllStops() {
    state = state.copyWith(showAllStops: !state.showAllStops);
  }
}

enum MapOverlaySource {
  currentLocationLayer,
}

@riverpod
class MapOverlayState extends _$MapOverlayState {
  @override
  Map<MapOverlaySource, String> build() {
    return {};
  }

  void setLocationMessage(String message) {
    state = {...state, MapOverlaySource.currentLocationLayer: message};
  }

  void clearLocationMessage() {
    final newState = {...state};
    newState.remove(MapOverlaySource.currentLocationLayer);
    state = newState;
  }
}
