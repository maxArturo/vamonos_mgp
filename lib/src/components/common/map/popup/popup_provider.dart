import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/services/map/markers/markers_provider.dart';

part 'popup_provider.g.dart';

mixin BasePopup on AutoDisposeNotifier<PopupController> {
  @override
  PopupController build() {
    return PopupController();
  }

  /// accesses the visible marker store and relays the corresponding marker(s)
  /// to the underlying popup controller
  void showPopupsOnlyFor(List<RouteStop> routeStops) async {
    // loop through route stops, pull out relevant markers and send them off
    final store = await ref.watch(markersMGPStoreProvider.future);
    store.map((s) {
      final markers = routeStops.map((stop) => s[stop]!).toList();
      return state.showPopupsOnlyFor(markers);
    });
  }
}

@riverpod
class StopViewPopupController extends _$StopViewPopupController with BasePopup {
  @override
  PopupController build() {
    return PopupController();
  }
}

@riverpod
PopupState stopViewPopupState(StopViewPopupStateRef ref) => PopupState();

@riverpod
class RouteViewPopupController extends _$RouteViewPopupController
    with BasePopup {
  @override
  PopupController build() {
    return PopupController();
  }
}

@riverpod
PopupState routeViewPopupState(RouteViewPopupStateRef ref) => PopupState();
