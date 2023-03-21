import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/entities/map_browser_view.dart';

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
