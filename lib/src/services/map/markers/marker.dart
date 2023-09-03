import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';

/// intended for rendering purposes only. Uses the `routeStopHashCode` property
/// to map into the corresponding [RouteStop]s and their relevant info.
class StopMarker extends Marker {
  final int routeStopHashCode;

  StopMarker(
      {required this.routeStopHashCode,
      double height = 30.0,
      double width = 30.0,
      required double latitude,
      required double longitude})
      : super(
            anchorPos: AnchorPos.align(AnchorAlign.center),
            height: height,
            width: width,
            point: LatLng(latitude, longitude),
            builder: (ctx) {
              return const FaIcon(FontAwesomeIcons.mapPin,
                  size: 35, color: Colors.black);
            });

  factory StopMarker.makeStop(
      {required RouteStop routeStop, required int hashCode}) {
    return StopMarker(
        routeStopHashCode: hashCode,
        latitude: routeStop.location.latitude,
        longitude: routeStop.location.longitude);
  }
}
