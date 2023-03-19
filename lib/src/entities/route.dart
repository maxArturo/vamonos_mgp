import 'package:vamonos_mgp/src/entities/transportation_mode.dart';

class Route {
  final TransportationMode mode;
  final String name;
  final String id;

  Route({required this.mode, required this.id, required this.name});
}

class DirectedRoute extends Route implements Comparable<DirectedRoute> {
  final String destination;
  final String pathName;

  DirectedRoute(
      {required Route route, required this.destination, required this.pathName})
      : super(id: route.id, name: route.name, mode: route.mode);

  @override
  int compareTo(DirectedRoute other) {
    return destination.compareTo(other.destination) +
        pathName.compareTo(other.pathName) +
        id.compareTo(other.id);
  }

  @override
  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is DirectedRoute && compareTo(other) == 0;
  }

  get canonicalIdentifier => '${destination}_$pathName';

  @override
  int get hashCode => canonicalIdentifier.hashCode;
}
