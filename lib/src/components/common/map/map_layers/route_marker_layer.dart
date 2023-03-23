import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/error_layer.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/marker_cluster/widget.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/markers_provider.dart';
import 'package:vamonos_mgp/src/components/common/map/popup/popup_provider.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/services/map/map_view_provider.dart';
import 'package:vamonos_mgp/src/util/extensions/riverpod.dart';

class RouteMarkerLayer extends ConsumerWidget {
  final StopMarker? selectedMarker;
  final DirectedRoute directedRoute;

  const RouteMarkerLayer(
      {super.key, this.selectedMarker, required this.directedRoute});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(routeMapViewStateProvider);
    if (viewState.showAllStops) {
      final res = ref.watch(routeMarkersWithinMapBoundsProvider(directedRoute));

      return res.fold(
        data: (markers) => MarkerClusterWidget(
            markers: markers,
            popupState: ref.watch(routeViewPopupStateProvider),
            popupController: ref.watch(routeViewPopupControllerProvider)),
        error: (err) => ErrorLayer(
          error: err,
          alignment: const Alignment(0, -0.8),
          color: Colors.red,
        ),
        loading: () => const SizedBox.shrink(), // empty widget
      );
    }

    return MarkerClusterWidget(
        markers: [
          if (selectedMarker != null) selectedMarker!,
        ],
        popupState: ref.watch(routeViewPopupStateProvider),
        popupController: ref.watch(routeViewPopupControllerProvider));
  }
}
