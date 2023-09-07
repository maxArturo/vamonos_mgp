import 'package:vamonos_mgp/src/entities/landmark.dart';
import 'package:vamonos_mgp/src/entities/route.dart';

class RouteLandMark extends LandMark implements Comparable<LandMark> {
  final DirectedRoute route;
  final bool isStoppingPoint;

  RouteLandMark(
      {required super.location,
      required this.route,
      this.isStoppingPoint = false});

  @override
  int compareTo(LandMark other) {
    int baseComparison = super.compareTo(other);
    if (other is RouteLandMark) {
      final routeComparison = route.compareTo(other.route);
      if (routeComparison != 0) return routeComparison;

      if (isStoppingPoint != other.isStoppingPoint) return -1;
    }
    return baseComparison;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other.runtimeType != runtimeType) return false;

    return other is RouteLandMark && compareTo(other) == 0;
  }

  @override
  int get hashCode =>
      super.hashCode ^ route.hashCode ^ isStoppingPoint.hashCode;
}
