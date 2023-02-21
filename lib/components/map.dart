import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamonos_mgp/adapters/location.dart';

class NavigationMap extends StatelessWidget {
  const NavigationMap({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getLocationData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // while data is loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return FlutterMap(
              options: MapOptions(
                center: LatLng(snapshot.data?.latitude ?? 0.0,
                    snapshot.data?.longitude ?? 0.0),
                zoom: 13,
                maxZoom: 15,
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
                  userAgentPackageName: 'com.vamonosmpg.app',
                ),
              ],
            );
          }
        });
  }
}
