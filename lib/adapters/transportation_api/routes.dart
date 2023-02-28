import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/entities/route_stop.dart';
import 'package:vamonos_mgp/entities/transportation_mode.dart';
import 'package:dio/dio.dart';

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

var dio = Dio();
final retryInterceptor = RetryInterceptor(
  dio: dio,
  logPrint: print, // specify log function (optional)
  retries: 3, // retry count (optional)
  retryDelays: const [ // set delays between retries (optional)
    Duration(seconds: 1), // wait 1 sec before first retry
    Duration(seconds: 2), // wait 2 sec before second retry
    Duration(seconds: 3), // wait 3 sec before third retry
  ],
); 

dio.interceptors.add(retryInterceptor);



Future<List<Route>> getAllAvailableRoutes() {

}

// Add the interceptor
/// Sending a failing request for 3 times with 1s, then 2s, then 3s interval
await dio.get('https://mock.codes/500');