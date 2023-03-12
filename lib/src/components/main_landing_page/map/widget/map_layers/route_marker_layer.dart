import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/widget_provider.dart';

stopMarkerLayer() {
  return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) =>
          ref.watch(allMarkersProvider).maybeWhen(
              orElse: () => const Text("An unhandled error occurred"),
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
                            popupController: ref.watch(popupControllerProvider),
                            popupBuilder: (_, marker) {
                              final stopMarker = marker as StopMarker;
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: 200,
                                height: 100,
                                child: GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "Route Name: ${stopMarker.routeStop.route.name}\n"
                                        "Route Destination: ${stopMarker.routeStop.route.destination}\n"
                                        "Route Path: ${stopMarker.routeStop.route.pathName}\n"
                                        "Route ID: ${stopMarker.routeStop.route.id}\n"
                                        "Stop Name: ${stopMarker.routeStop.description}"),
                                  ),
                                ),
                              );
                            }),
                        builder: (context, markers) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue),
                            child: Center(
                              child: Text(
                                markers.length.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )));
}
