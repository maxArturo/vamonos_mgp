import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/map.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/map_layers/center_pin_layer.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/map_layers/current_location_layer.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/map_layers/polyline_layer.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/map_layers/route_marker_layer.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/map_layers/tile_layer.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/widget_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';

class NavigationMapView
    extends WidgetView<NavigationMap, NavigationMapController> {
  final LocationData initialLocation;

  const NavigationMapView(
    super.state, {
    super.key,
    required this.initialLocation,
  });

  @override
  Widget build(BuildContext context) {
    final mapCenter = LatLng(
        initialLocation.latitude ?? 0.0, initialLocation.longitude ?? 0.0);
    const defaultZoom = 17.0;

    debugPrint("[MapNavigationViewWidget]: map of type ${widget.view} rebuilt");
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) =>
          FlutterMap(
        key: ValueKey(widget.view),
        mapController: state.mc,
        options: MapOptions(
            onMapReady: () {
              ref
                  .read((widget.view == MapBrowserView.stopView
                          ? stopViewMapControllerProvider
                          : routeViewMapControllerProvider)
                      .notifier)
                  .initialize(state.mc);
            },
            center: mapCenter,
            zoom: defaultZoom,
            maxZoom: 18,
            minZoom: widget.view == MapBrowserView.routeView ? 14 : 16.5,
            onTap: (tapPosition, point) =>
                ref.read(popupControllerProvider).hideAllPopups()),
        nonRotatedChildren: nonRotatedChildren(),
        children: [
          tileLayer(),
          centerMarkerLayer(),
          widget.view == MapBrowserView.routeView
              ? polylineLayer(directedRoute: widget.directedRoute!)
              : stopMarkerLayer(),
        ],
      ),
    );
  }
}
