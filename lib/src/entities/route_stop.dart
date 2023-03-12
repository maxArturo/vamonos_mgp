import 'package:vamonos_mgp/src/entities/route_landmark.dart';

class RouteStop extends RouteLandMark {
  final String id;
  final String name;
  final String description;

  RouteStop(
      {required super.route,
      required super.location,
      required this.id,
      required this.name,
      required this.description,
      super.isStoppingPoint = true});
}
