import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:vamonos_mgp/components/common/widget_view.dart';
import 'package:vamonos_mgp/providers/location.dart';
import 'package:vamonos_mgp/providers/map.dart';

class NavigationMap extends StatefulWidget {
  const NavigationMap({super.key});

  @override
  State<NavigationMap> createState() => _NavigationMapController();
}

class _NavigationMapController extends State<NavigationMap> {
  @override
  Widget build(BuildContext context) {
    return _NavigationMapView(this);
  }
}

class _NavigationMapView
    extends WidgetView<NavigationMap, _NavigationMapController> {
  const _NavigationMapView(super.state);

  @override
  Widget build(BuildContext context) {
    final locationProvider = context.watch<LocationProviderStore>();

    if (locationProvider.displayedLocation == null) {
      locationProvider.currentLocationData
          .then((locData) => locationProvider.updateLocation(locData));
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      Provider.of<MapProviderStore>(context).initializeMapController();
      return FlutterMap(
        mapController: Provider.of<MapProviderStore>(context).mapController,
        options: MapOptions(
          center: LatLng(locationProvider.displayedLocation?.latitude ?? 0.0,
              locationProvider.displayedLocation?.longitude ?? 0.0),
          zoom: 15,
          maxZoom: 18,
        ),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.ar.vamonosmpg.app',
          ),
        ],
      );
    }
  }
}
