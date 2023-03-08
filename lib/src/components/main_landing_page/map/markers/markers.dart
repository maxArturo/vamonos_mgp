import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamonos_mgp/src/entities/route_stop_landmark.dart';
import 'package:vamonos_mgp/src/entities/transportation_mode.dart';

class StopMarker extends Marker {
  final RouteStopLandMark landmark;
  final String stopName;

  StopMarker({required this.stopName, required this.landmark})
      : super(
            anchorPos: AnchorPos.align(AnchorAlign.center),
            height: 30,
            width: 30,
            point: LatLng(
                landmark.location.latitude!, landmark.location.longitude!),
            builder: (ctx) {
              switch (landmark.route.mode) {
                case TransportationMode.bus:
                  return const Icon(Icons.directions_bus_filled_sharp);
                default:
                  return const Icon(Icons.directions_bus_filled_sharp);
              }
            });
}
