import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vamonos_mgp/src/adapters/map_tile/map_tile_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget_provider.dart';
import 'package:vamonos_mgp/src/services/location/location_provider.dart';

class NavigationMapView extends StatelessWidget {
  final LocationData _initialLocation;
  final MapController _mapController;

  const NavigationMapView(this._initialLocation, this._mapController,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // todo check if stack is needed here
      children: [
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) =>
              FlutterMap(
            mapController: _mapController,
            options: MapOptions(
                center: LatLng(_initialLocation.latitude ?? 0.0,
                    _initialLocation.longitude ?? 0.0),
                zoom: 16,
                maxZoom: 18,
                onTap: (tapPosition, point) =>
                    ref.watch(popupControllerProvider).hideAllPopups()),
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
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                    TileLayer(
                  tileProvider: ref.watch(cachedTileAdapterProvider),
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.ar.vamonosmpg.app',
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  return ref.watch(locationServiceProvider).maybeWhen(
                      data: (loc) => MarkerLayer(
                            markers: [
                              Marker(
                                  rotate: true,
                                  point: LatLng(loc.latitude!, loc.longitude!),
                                  anchorPos:
                                      AnchorPos.align(AnchorAlign.center),
                                  height: 40,
                                  width: 40,
                                  builder: (context) => const Icon(
                                        Icons.location_on_sharp,
                                        color: Colors.red,
                                        size: 40,
                                      )),
                            ],
                          ),
                      orElse: () => const Icon(
                            Icons.warning,
                            color: Colors.red,
                            size: 40,
                          ));
                },
              ),
              Consumer(
                  builder: (BuildContext context, WidgetRef ref,
                          Widget? child) =>
                      ref.watch(allMarkersProvider).maybeWhen(
                          orElse: () =>
                              const Text("An unhandled error occurred"),
                          data: (data) => data.fold(
                                (err) => Text("An error of type $err occurred"),
                                (markers) => MarkerClusterLayerWidget(
                                  options: MarkerClusterLayerOptions(
                                    maxClusterRadius: 50,
                                    size: const Size(40, 40),
                                    anchor: AnchorPos.align(AnchorAlign.center),
                                    fitBoundsOptions: const FitBoundsOptions(
                                      padding: EdgeInsets.all(50),
                                      maxZoom: 15,
                                    ),
                                    markers: markers,
                                    popupOptions: PopupOptions(
                                        popupState: PopupState(),
                                        popupSnap: PopupSnap.markerTop,
                                        popupController:
                                            ref.watch(popupControllerProvider),
                                        popupBuilder: (_, marker) => Container(
                                              width: 200,
                                              height: 100,
                                              color: Colors.white,
                                              child: GestureDetector(
                                                onTap: () =>
                                                    debugPrint('Popup tap!'),
                                                child: Text(
                                                  'Container popup for marker at ${marker.point}',
                                                ),
                                              ),
                                            )),
                                    builder: (context, markers) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.blue),
                                        child: Center(
                                          child: Text(
                                            markers.length.toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ))),
            ],
          ),
        )
      ],
    );
  }
}
