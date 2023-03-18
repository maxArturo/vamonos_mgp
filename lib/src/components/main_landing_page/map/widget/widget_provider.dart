import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'widget_provider.g.dart';

@Riverpod(keepAlive: true)
PopupController stopViewPopupController(StopViewPopupControllerRef ref) {
  return PopupController();
}

@Riverpod(keepAlive: true)
PopupState stopViewPopupState(StopViewPopupStateRef ref) => PopupState();

@Riverpod(keepAlive: true)
PopupController routeViewPopupController(RouteViewPopupControllerRef ref) {
  return PopupController();
}

@Riverpod(keepAlive: true)
PopupState routeViewPopupState(RouteViewPopupStateRef ref) => PopupState();
