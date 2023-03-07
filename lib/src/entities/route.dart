import 'package:vamonos_mgp/src/entities/transportation_mode.dart';

class Route {
  final TransportationMode mode;
  final String name;
  final String id;

  Route({required this.mode, required this.id, required this.name});
}
