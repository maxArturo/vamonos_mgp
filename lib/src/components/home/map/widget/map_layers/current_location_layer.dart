import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamonos_mgp/src/services/location/location_provider.dart';

centerMarkerLayer() {
  return Consumer(
    builder: (context, ref, child) {
      return ref.watch(updatedLocationServiceProvider).maybeWhen(
          data: (loc) => MarkerLayer(
                markers: [
                  Marker(
                      rotate: true,
                      point: LatLng(loc.latitude!, loc.longitude!),
                      anchorPos: AnchorPos.align(AnchorAlign.center),
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
  );
}
