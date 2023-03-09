import 'package:vamonos_mgp/src/entities/transportation_mode.dart';

class Route {
  final TransportationMode mode;
  final String name;
  final String id;

  Route({required this.mode, required this.id, required this.name});
}

class DirectedRoute extends Route {
  final String direction;
  DirectedRoute({required Route route, required this.direction})
      : super(id: route.id, name: route.name, mode: route.mode);
}
