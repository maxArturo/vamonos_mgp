import 'package:location/location.dart';
import 'package:vamonos_mgp/entities/route.dart';

class RouteStop {
  final Route route;
  final String name;
  final int id;
  final LocationData location;
  RouteStop(this.route, this.name, this.location, this.id);
}
