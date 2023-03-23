import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/marker_cluster/widget.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/common/map/popup/popup_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_view_provider.dart';

class RouteMarkerLayer extends ConsumerWidget {
  final StopMarker? selectedMarker;

  const RouteMarkerLayer({super.key, this.selectedMarker});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if route map view state is show all stops
    // get all stops and show otherwise just selected marker
    final viewState = ref.watch(routeMapViewStateProvider);
    if (viewState.showAllStops) {
      return MarkerClusterWidget(
          markers: [
            if (selectedMarker != null) selectedMarker!,
          ],
          popupState: ref.watch(routeViewPopupStateProvider),
          popupController: ref.watch(routeViewPopupControllerProvider));
    }

    return MarkerClusterWidget(
        markers: [
          if (selectedMarker != null) selectedMarker!,
        ],
        popupState: ref.watch(routeViewPopupStateProvider),
        popupController: ref.watch(routeViewPopupControllerProvider));
  }
}
