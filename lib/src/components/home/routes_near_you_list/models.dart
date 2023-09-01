import 'package:vamonos_mgp/src/entities/route_stop.dart';

class RouteCardData {
  final String routeName;
  final List<RouteStop> closestStopsByUniqueDirection;

  RouteCardData(
      {required this.routeName, required this.closestStopsByUniqueDirection});
}
