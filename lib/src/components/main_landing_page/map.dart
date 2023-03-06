import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/services/location/location_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';

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
    return Consumer(builder: (context, ref, child) {
      return ref.read(locationServiceProvider).maybeWhen(
          data: (location) {
            return ref.read(mapControllerServiceProvider).maybeWhen(
                data: (mapController) => Stack(
                      // todo check if stack is needed here
                      children: [
                        FlutterMap(
                          mapController: mapController,
                          options: MapOptions(
                            center: LatLng(location.latitude ?? 0.0,
                                location.longitude ?? 0.0),
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
                              onSourceTapped: () => launchUrl(Uri.https(
                                  'www.openstreetmap.org', '/fixthemap')),
                            ),
                          ],
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.ar.vamonosmpg.app',
                            ),
                            Consumer(
                              builder: (context, ref, child) {
                                return ref
                                    .watch(locationServiceProvider)
                                    .maybeWhen(
                                        data: (loc) => MarkerLayer(
                                              markers: [
                                                Marker(
                                                    rotate: true,
                                                    point: LatLng(loc.latitude!,
                                                        loc.longitude!),
                                                    anchorPos: AnchorPos.align(
                                                        AnchorAlign.center),
                                                    height: 40,
                                                    width: 40,
                                                    builder: (context) =>
                                                        const Icon(
                                                          Icons
                                                              .location_on_sharp,
                                                          color: Colors.red,
                                                          size: 40,
                                                        )),
                                              ],
                                            ),
                                        orElse: () =>
                                            const Text("an error occured"));
                              },
                            )
                          ],
                        )
                      ],
                    ),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                orElse: () =>
                    const Text("An error occurred setting up the map"));
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
          orElse: () => const Text("An error occurred fetching location data"));
    });
  }
}
