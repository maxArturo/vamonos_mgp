import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/entities/transportation_mode.dart';

class StopMarker extends Marker {
  final RouteStop routeStop;
  final String stopName;

  StopMarker({required this.stopName, required this.routeStop})
      : super(
            anchorPos: AnchorPos.align(AnchorAlign.center),
            height: 30,
            width: 30,
            point: LatLng(
                routeStop.location.latitude!, routeStop.location.longitude!),
            builder: (ctx) {
              switch (routeStop.route.mode) {
                case TransportationMode.bus:
                  return const Icon(
                    Icons.directions_bus_filled_sharp,
                    size: 35,
                  );
                default:
                  return const Icon(Icons.directions_bus_filled_sharp);
              }
            });
}
