import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';

class StopMarker extends Marker {
  final RouteStop routeStop;
  final String stopName;

  StopMarker(
      {required this.stopName,
      required this.routeStop,
      Color? color = Colors.black})
      : super(
            anchorPos: AnchorPos.align(AnchorAlign.center),
            height: 30,
            width: 30,
            point: LatLng(
                routeStop.location.latitude!, routeStop.location.longitude!),
            builder: (ctx) {
              return FaIcon(
                FontAwesomeIcons.mapPin,
                size: 35,
                color: color,
              );
            });
}
