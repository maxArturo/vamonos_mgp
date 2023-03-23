import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'popup_provider.g.dart';

@riverpod
PopupController stopViewPopupController(StopViewPopupControllerRef ref) {
  return PopupController();
}

@riverpod
PopupState stopViewPopupState(StopViewPopupStateRef ref) => PopupState();

@riverpod
PopupController routeViewPopupController(RouteViewPopupControllerRef ref) {
  return PopupController();
}

@riverpod
PopupState routeViewPopupState(RouteViewPopupStateRef ref) => PopupState();
