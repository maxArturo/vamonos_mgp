import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/map.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/services/mgp_route/stop_arrivals/stop_arrivals_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

class StopMarkerPopup extends ConsumerWidget {
  final StopMarker stop;
  const StopMarkerPopup({required this.stop, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arrivals =
        ref.watch(stopArrivalsByStopProvider(stop: stop.routeStop));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Route Name: ${stop.routeStop.route.name}\n"
              "Stop Name: ${stop.routeStop.description}"),
          arrivals.maybeWhen(
              data: (arrivalData) => arrivalData.fold((l) {
                    String errorMessage;
                    switch (l.errorType) {
                      case ErrorType.dataNotFoundError:
                        errorMessage = "data not found for this stop";
                        break;

                      default:
                        errorMessage = "An unexpected error occurred";
                    }
                    return Text(
                      errorMessage,
                      key: const Key('error'),
                      style: const TextStyle(color: Colors.red),
                    );
                  }, (r) => Text(r[0].arrival)),
              loading: () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("loading arrival times"),
                      SizedBox(width: 20),
                      SpinKitWave(
                        color: Colors.blue,
                        size: 20,
                      )
                    ],
                  ),
              orElse: () => const Text(
                    "An unexpected error occurred",
                    key: Key('error'),
                    style: TextStyle(color: Colors.red),
                  )),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      maintainState: false,
                      builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                  '${stop.routeStop.route.destination} via ${stop.routeStop.route.pathName}'
                                      .toUpperCase(),
                                  style: const TextStyle(color: Colors.white)),
                            ),
                            backgroundColor: Theme.of(context).primaryColorDark,
                          ),
                          body: NavigationMap(
                            view: MapBrowserView.routeView,
                            directedRoute: stop.routeStop.route,
                          ))),
                );
              },
              child: const Text("Click to see route \non map"))
        ],
      ),
    );
  }
}
