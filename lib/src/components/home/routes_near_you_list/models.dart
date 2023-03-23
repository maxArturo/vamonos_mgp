import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';

class RouteCardData {
  final String routeName;
  final List<StopMarker> closestStopsByUniqueDirection;

  RouteCardData(
      {required this.routeName, required this.closestStopsByUniqueDirection});
}
