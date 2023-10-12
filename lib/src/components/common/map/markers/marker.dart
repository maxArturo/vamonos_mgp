import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamonos_mgp/src/entities/coordinate.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';

const defaultMarkerColor = Color.fromARGB(255, 21, 51, 247);
defaultMarkerIcon({color = defaultMarkerColor, size = 25.0}) =>
    FaIcon(FontAwesomeIcons.circleDot, size: size, color: color);

class StopMarker extends Marker {
  final List<RouteStop> routeStops;
  final Coordinate coordinate;

  StopMarker(
      {required this.routeStops,
      required this.coordinate,
      color = defaultMarkerColor,
      double size = 25.0})
      : super(
            anchorPos: AnchorPos.align(AnchorAlign.center),
            height: size,
            width: size,
            point: LatLng(coordinate.latitude, coordinate.longitude),
            builder: (ctx) => defaultMarkerIcon(color: color, size: size));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StopMarker && coordinate == other.coordinate;
  }

  StopMarker copyWith(
      {List<RouteStop>? routeStops,
      Color? color,
      Coordinate? coordinate,
      double? size}) {
    return StopMarker(
        routeStops: routeStops ?? this.routeStops,
        coordinate: coordinate ?? this.coordinate,
        color: color,
        size: size ?? 30.0);
  }

  @override
  int get hashCode => coordinate.hashCode ^ routeStops.hashCode;
}
