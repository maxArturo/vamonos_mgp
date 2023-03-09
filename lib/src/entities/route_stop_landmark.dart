import 'package:vamonos_mgp/src/entities/landmark.dart';
import 'package:vamonos_mgp/src/entities/route.dart';

class RouteStopLandMark extends LandMark {
  final DirectedRoute route;
  final bool isStoppingPoint;

  RouteStopLandMark(
      {required super.location,
      required this.route,
      this.isStoppingPoint = false});
}
