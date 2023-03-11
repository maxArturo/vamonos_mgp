import 'package:vamonos_mgp/src/entities/route_landmark.dart';

class RouteStop extends RouteLandMark {
  final String name;
  final int id;

  RouteStop(
      {required super.route,
      required super.location,
      required this.name,
      required this.id});
}
