import 'package:vamonos_mgp/src/entities/route_stop_landmark.dart';

class RouteStop extends RouteStopLandMark {
  final String name;
  final int id;

  RouteStop(
      {required super.route,
      required super.location,
      required this.name,
      required this.id});
}
