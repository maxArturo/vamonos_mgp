import 'package:vamonos_mgp/src/entities/transportation_mode.dart';

class Route {
  final TransportationMode mode;
  final String name;
  final String id;
  Route(this.mode, this.id, this.name);
}
