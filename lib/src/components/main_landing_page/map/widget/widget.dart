import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/map_layers/center_pin_layer.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/map_layers/current_location_layer.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/map_layers/route_marker_layer.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/map_layers/tile_layer.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/widget_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';

class NavigationMapView extends StatelessWidget {
  final LocationData _initialLocation;
  final MapController _mapController;

  const NavigationMapView(this._initialLocation, this._mapController,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final mapCenter = LatLng(
        _initialLocation.latitude ?? 0.0, _initialLocation.longitude ?? 0.0);
    const defaultZoom = 17.0;
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) =>
          FlutterMap(
        mapController: _mapController,
        options: MapOptions(
            onMapReady: () => _mapController.mapEventSink
                .add(MapEventInitialized(center: mapCenter, zoom: defaultZoom)),
            center: mapCenter,
            zoom: defaultZoom,
            maxZoom: 18,
            minZoom: ref.watch(mapBrowserStateProvider.notifier).isRouteView
                ? 15
                : 17,
            onTap: (tapPosition, point) =>
                ref.watch(popupControllerProvider).hideAllPopups()),
        nonRotatedChildren: nonRotatedChildren(),
        children: [
          tileLayer(),
          centerMarkerLayer(),
          stopMarkerLayer(),
          // polylineLayer(),
        ],
      ),
    );
  }
}
