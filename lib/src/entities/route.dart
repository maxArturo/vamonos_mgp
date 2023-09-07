import 'package:vamonos_mgp/src/entities/transportation_mode.dart';

class Route implements Comparable<Route> {
  final TransportationMode mode;
  final String name;
  final String id;

  Route({required this.mode, required this.id, required this.name});

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Route && compareTo(other) == 0;
  }

  @override
  int get hashCode => mode.hashCode ^ name.hashCode ^ id.hashCode;

  @override
  int compareTo(Route other) {
    if (mode.index < other.mode.index) return -1;
    if (mode.index > other.mode.index) return 1;

    int nameComparison = name.compareTo(other.name);
    if (nameComparison != 0) return nameComparison;

    return id.compareTo(other.id);
  }
}

class DirectedRoute extends Route {
  final String destination;
  final String pathName;

  DirectedRoute(
      {required Route route, required this.destination, required this.pathName})
      : super(id: route.id, name: route.name, mode: route.mode);

  @override
  int compareTo(Route other) {
    int baseComparison = super.compareTo(other);
    if (other is DirectedRoute) {
      int destComparison = destination.compareTo(other.destination);
      if (destComparison != 0) return destComparison;

      int pathComparison = pathName.compareTo(other.pathName);
      if (pathComparison != 0) return pathComparison;
    }
    return baseComparison;
  }

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;

    if (other.runtimeType != runtimeType) return false;

    return other is DirectedRoute && compareTo(other) == 0;
  }

  get canonicalIdentifier => '${destination}_$pathName';

  @override
  int get hashCode => canonicalIdentifier.hashCode;
}
