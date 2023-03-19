import 'package:vamonos_mgp/src/components/home/map/markers/markers.dart';

class RouteCardData {
  final String routeName;
  final List<StopMarker> closestStopsByUniqueDirection;

  RouteCardData(
      {required this.routeName, required this.closestStopsByUniqueDirection});
}
