import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';

class RouteCardData {
  final String displayedRouteName;
  final List<RouteStopMarker> routeStopMarkers;

  RouteCardData(
      {required this.displayedRouteName, required this.routeStopMarkers});
}

class RouteStopMarker {
  final StopMarker marker;
  final RouteStop stop;

  RouteStopMarker({required this.stop, required this.marker});
}
