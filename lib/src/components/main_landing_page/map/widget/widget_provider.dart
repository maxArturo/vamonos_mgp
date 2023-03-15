import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'widget_provider.g.dart';

@riverpod
PopupController popupController(PopupControllerRef ref) => PopupController();

@riverpod
PopupState popupState(PopupStateRef ref) => PopupState();

enum MapBrowserStateEnum {
  stopView,
  routeView,
}

@riverpod
class MapBrowserState extends _$MapBrowserState {
  @override
  MapBrowserStateEnum build() {
    return MapBrowserStateEnum.stopView;
  }

  get isRouteView => state == MapBrowserStateEnum.routeView;
  get isStopView => state == MapBrowserStateEnum.stopView;

  void setRouteView() {
    state = MapBrowserStateEnum.routeView;
  }

  void setStopView() {
    state = MapBrowserStateEnum.stopView;
  }
}
