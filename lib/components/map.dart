import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vamonos_mgp/components/common/widget_view.dart';
import 'package:vamonos_mgp/providers/location.dart';

class NavigationMap extends StatefulWidget {
  const NavigationMap({super.key});

  @override
  State<NavigationMap> createState() => _NavigationMapController();
}

class _NavigationMapController extends State<NavigationMap> {
  LocationData? _displayedLocation;
  LocationData? get displayedLocation => _displayedLocation;

  void updateLocation(LocationData newLocation) {
    setState(() {
      _displayedLocation = newLocation;
    });
  }

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
    final locationProvider = Provider.of<LocationProviderStore>(context);

    if (state.displayedLocation == null) {
      locationProvider.currentLocationData
          .then((locData) => state.updateLocation(locData));
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      locationProvider.initializeMapController();
      return Stack(
        children: [
          FlutterMap(
            mapController:
                Provider.of<LocationProviderStore>(context, listen: false)
                    .mapController,
            options: MapOptions(
              center: LatLng(state.displayedLocation?.latitude ?? 0.0,
                  state.displayedLocation?.longitude ?? 0.0),
              zoom: 16,
              maxZoom: 18,
            ),
            nonRotatedChildren: [
              const Center(
                  child: Icon(
                Icons.location_on_sharp,
                color: Colors.black,
                size: 40,
                weight: 800,
              )),
              AttributionWidget.defaultWidget(
                alignment: const Alignment(0.0, 0.6),
                source: 'OpenStreetMap contributors',
                onSourceTapped: () =>
                    launchUrl(Uri.https('www.openstreetmap.org', '/fixthemap')),
              ),
            ],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.ar.vamonosmpg.app',
              ),
              Consumer<LocationProviderStore>(
                builder: (context, provider, child) {
                  final lat = provider.latestLocationData.latitude;
                  final long = provider.latestLocationData.longitude;
                  return MarkerLayer(
                    markers: [
                      Marker(
                          rotate: true,
                          point: LatLng(lat!, long!),
                          anchorPos: AnchorPos.align(AnchorAlign.center),
                          height: 40,
                          width: 40,
                          builder: (context) => const Icon(
                                Icons.location_on_sharp,
                                color: Colors.red,
                                size: 40,
                              )),
                    ],
                  );
                },
              )
            ],
          )
        ],
      );
    }
  }
}
