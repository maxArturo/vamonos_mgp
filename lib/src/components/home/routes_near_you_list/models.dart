import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';

class RouteCardData {
  final String displayedRouteName;
  final List<RouteStopMarker> directedRoutes;

  RouteCardData(
      {required this.displayedRouteName, required this.directedRoutes});
}

class RouteStopMarker {
  final StopMarker marker;
  final RouteStop stop;

  RouteStopMarker({required this.stop, required this.marker});
}
