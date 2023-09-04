import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/attribution_layer.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/current_location_layer.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/polyline_layer.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/route_marker_layer.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/tile_layer.dart';
import 'package:vamonos_mgp/src/components/common/map/map_overlay/widget.dart';
import 'package:vamonos_mgp/src/components/common/map/popup/popup_provider.dart';
import 'package:vamonos_mgp/src/components/common/map/route_map/widget.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/entities/coordinate.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_view_provider.dart';

class RouteMapView extends ConsumerWidgetView<RouteMap, RouteMapController> {
  final Coordinate initialLocation;
  final defaultZoom = 13.0;

  const RouteMapView(
    super.state, {
    super.key,
    required this.initialLocation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapCenter =
        LatLng(initialLocation.latitude, initialLocation.longitude);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        FlutterMap(
          key: ValueKey(widget.view),
          mapController: state.mc,
          options: MapOptions(
              onMapReady: () {
                ref
                    .read(routeViewMapControllerProvider.notifier)
                    .initialize(state.mc);

                ref.read(mapViewProvider.notifier).setRouteView();
              },
              center: mapCenter,
              zoom: defaultZoom,
              maxZoom: 18,
              minZoom: 12,
              onTap: (tapPosition, point) =>
                  ref.read(routeViewPopupControllerProvider).hideAllPopups()),
          nonRotatedChildren: const [
            AttributionLayer(
              dockToBottom: true,
            ),
          ],
          children: [
            const TileLayerWidget(),
            PolylineLayerWidget(directedRoute: widget.directedRoute),
            RouteMarkerLayer(
                directedRoute: widget.directedRoute,
                selectedMarker: widget.selectedMarker),
            const CurrentLocationLayer(),
          ],
        ),
        const MapOverlay(),
      ],
    );
  }
}
