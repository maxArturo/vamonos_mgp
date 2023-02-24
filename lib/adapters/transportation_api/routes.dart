import 'package:location/location.dart';
import 'package:vamonos_mgp/entities/route_stop.dart';
import 'package:vamonos_mgp/entities/transportation_mode.dart';

import '../../entities/route.dart';

Future<List<RouteStop>> getRoutesNearYou({LocationData? location}) {
  return Future.sync(() {
    final Route testRoute =
        Route(TransportationMode.bus, "test_route_one", "0001");
    return List<int>.generate(20, (e) => e)
        .map((e) => RouteStop(testRoute, "testStop_$e",
            LocationData.fromMap({'latitude': 30.0, 'longitude': 30.0}), e))
        .toList();
  });
}
