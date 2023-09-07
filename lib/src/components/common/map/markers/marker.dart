import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamonos_mgp/src/entities/coordinate.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';

class StopMarker extends Marker {
  final List<RouteStop> routeStops;
  final Coordinate coordinate;
  final Color color;

  StopMarker(
      {required this.routeStops,
      required this.coordinate,
      this.color = Colors.black})
      : super(
            anchorPos: AnchorPos.align(AnchorAlign.center),
            height: 30,
            width: 30,
            point: LatLng(coordinate.latitude, coordinate.longitude),
            builder: (ctx) {
              return FaIcon(
                FontAwesomeIcons.mapPin,
                size: 35,
                color: color,
              );
            });

  StopMarker copyWith(
      {List<RouteStop>? routeStops,
      String? stopName,
      Color? color,
      Coordinate? coordinate}) {
    return StopMarker(
        routeStops: routeStops ?? this.routeStops,
        color: color ?? this.color,
        coordinate: coordinate ?? this.coordinate);
  }
}
