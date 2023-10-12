import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/error_sink.dart';
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
          skipLoadingOnReload: true,
          data: (markers) {
            if (selectedMarker != null) {
              markers.remove(selectedMarker!);
            }
            return MarkerClusterWidget(
                maxClusterRadius: 35,
                markers: markers,
                popupController: ref.watch(routeViewPopupControllerProvider));
          },
          loading: () => const SizedBox.shrink(), // empty widget
          error: errorSink);
    }

    return MarkerClusterWidget(
        markers: const [],
        popupController: ref.watch(routeViewPopupControllerProvider));
  }
}
