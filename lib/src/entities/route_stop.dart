import 'package:vamonos_mgp/src/entities/route_landmark.dart';

class RouteStop extends RouteLandMark {
  final String id;
  final String name;
  final String description;
  final String abbrevDirection;
  final String extendedDirection;

  RouteStop({
    required super.route,
    required super.location,
    required this.id,
    required this.name,
    required this.description,
    required this.abbrevDirection,
    required this.extendedDirection,
  });
}
