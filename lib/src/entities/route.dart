import 'package:vamonos_mgp/src/entities/transportation_mode.dart';

class Route {
  final TransportationMode mode;
  final String name;
  final String id;

  Route({required this.mode, required this.id, required this.name});
}

class DirectedRoute extends Route implements Comparable {
  final String destination;
  final String pathName;

  DirectedRoute(
      {required Route route, required this.destination, required this.pathName})
      : super(id: route.id, name: route.name, mode: route.mode);

  @override
  int compareTo(other) {
    return destination.compareTo(other.destination) +
        pathName.compareTo(other.pathName) +
        id.compareTo(other.id);
  }

  get canonicalIdentifier => '${destination}_$pathName';
}
