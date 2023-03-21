import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/error_layer.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/marker_cluster/widget.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/markers_provider.dart';
import 'package:vamonos_mgp/src/components/common/map/popup/popup_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

class RouteMarkerLayer extends ConsumerWidget {
  final List<StopMarker> routeStopMarkers;

  const RouteMarkerLayer({
    super.key,
    required this.routeStopMarkers,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MarkerClusterWidget(
        markers: routeStopMarkers,
        popupState: ref.watch(routeViewPopupStateProvider),
        popupController: ref.watch(routeViewPopupControllerProvider));
  }
}

class StopMarkerLayer extends ConsumerWidget {
  const StopMarkerLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(markersWithinMapBoundsProvider).maybeWhen(
        orElse: () => ErrorLayer(
              error: UntypedError(),
              alignment: const Alignment(0, -0.8),
              color: Colors.red,
            ),
        data: (data) => data.fold(
              (err) => ErrorLayer(
                error: err,
                alignment: const Alignment(0, -0.8),
                color: Colors.red,
              ),
              (markers) => MarkerClusterWidget(
                  markers: markers,
                  popupState: ref.watch(stopViewPopupStateProvider),
                  popupController: ref.watch(stopViewPopupControllerProvider)),
            ));
  }
}
