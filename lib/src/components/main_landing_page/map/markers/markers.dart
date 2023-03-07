import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamonos_mgp/src/entities/route_stop_landmark.dart';
import 'package:vamonos_mgp/src/entities/transportation_mode.dart';

// TODO here here we need to inject location details
Marker toMarker(RouteStopLandMark stop) => Marker(
    anchorPos: AnchorPos.align(AnchorAlign.center),
    height: 30,
    width: 30,
    point: LatLng(stop.location.latitude!, stop.location.longitude!),
    builder: (ctx) {
      switch (stop.route.mode) {
        case TransportationMode.bus:
          return const Icon(Icons.directions_bus_filled_sharp);
        default:
          return const Icon(Icons.directions_bus_filled_sharp);
      }
    });
