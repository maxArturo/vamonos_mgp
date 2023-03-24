import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/attribution_layer.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/current_location_layer.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/stop_marker_layer.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/stops_center_pin_layer.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/tile_layer.dart';
import 'package:vamonos_mgp/src/components/common/map/popup/popup_provider.dart';
import 'package:vamonos_mgp/src/components/common/map/stop_view_map/widget.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_view_provider.dart';

class StopMapView extends ConsumerWidgetView<StopMap, StopMapController> {
  final LocationData initialLocation;
  final defaultZoom = 17.0;

  const StopMapView(
    super.state, {
    super.key,
    required this.initialLocation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapCenter = LatLng(
        initialLocation.latitude ?? 0.0, initialLocation.longitude ?? 0.0);

    debugPrint("[StopMapView]: rebuilt");
    return FlutterMap(
      key: ValueKey(widget.view),
      mapController: state.mc,
      options: MapOptions(
          onMapReady: () {
            ref
                .read(stopViewMapControllerProvider.notifier)
                .initialize(state.mc);

            ref.read(mapViewProvider.notifier).setStopView();
          },
          center: mapCenter,
          zoom: defaultZoom,
          maxZoom: 18,
          minZoom: 16.5,
          onTap: (tapPosition, point) =>
              ref.read(stopViewPopupControllerProvider).hideAllPopups()),
      nonRotatedChildren: const [
        StopsCenterPinLayer(),
        AttributionLayer(),
      ],
      children: const [
        TileLayerWidget(),
        StopMarkerLayer(),
        CurrentLocationLayer(),
      ],
    );
  }
}
