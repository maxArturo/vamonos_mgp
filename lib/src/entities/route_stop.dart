import 'package:vamonos_mgp/src/entities/landmark.dart';
import 'package:vamonos_mgp/src/entities/route_landmark.dart';

class RouteStop extends RouteLandMark implements Comparable<LandMark> {
  final String id;
  final String name;
  final String description;

  @override
  toString() => "id: $id\n"
      "name: $name\n"
      "description: $description\n"
      "direction: ${route.canonicalIdentifier}";

  RouteStop(
      {required super.route,
      required super.location,
      required this.id,
      required this.name,
      required this.description,
      super.isStoppingPoint = true});

  @override
  int compareTo(LandMark other) {
    int baseComparison = super.compareTo(other);
    if (other is RouteStop) {
      final idComp = id.compareTo(other.id);
      final nameComp = name.compareTo(other.name);
      final descComp = description.compareTo(other.description);
      final coordComp = location.compareTo(other.location);

      return idComp - nameComp - descComp - coordComp;
    }

    return baseComparison;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RouteStop && compareTo(other) == 0;
  }

  @override
  int get hashCode =>
      super.hashCode ^ id.hashCode ^ name.hashCode ^ description.hashCode;
}
