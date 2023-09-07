import 'package:vamonos_mgp/src/entities/route_stop.dart';

class StopArrival {
  final RouteStop stop;
  // this will be < 0 if not available
  final int nextArrivalInMinutes;

  StopArrival({required this.stop, required this.nextArrivalInMinutes});
}
