import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/common/map/route_map/widget.dart';
import 'package:vamonos_mgp/src/entities/map_browser_view.dart';
import 'package:vamonos_mgp/src/services/map/map_view_provider.dart';
import 'package:vamonos_mgp/src/services/mgp_route/stop_arrivals/stop_arrivals_provider.dart';
import 'package:vamonos_mgp/src/util/extensions/riverpod.dart';

class StopMarkerPopup extends ConsumerWidget {
  final StopMarker stop;
  const StopMarkerPopup({required this.stop, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arrivals =
        ref.watch(stopArrivalsByStopProvider(stop: stop.routeStop));
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(child: Text("Route Name: ${stop.routeStop.route.name}\n")),
        arrivals.fold(
            data: (r) => Flexible(child: Text(r[0].arrival)),
            error: (l) {
              return Text(
                l.userText,
                key: const Key('error'),
                style: const TextStyle(color: Colors.red),
              );
            },
            loading: () => Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SpinKitWave(
                        color: Colors.blue,
                        size: 20,
                      )
                    ],
                  ),
                )),
        if (ref.watch(mapViewProvider) == MapBrowserView.stopView)
          Flexible(
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        maintainState: false,
                        builder: (context) => Scaffold(
                            appBar: AppBar(
                              leading: Builder(
                                builder: (BuildContext context) {
                                  return IconButton(
                                    icon: const Icon(Icons.arrow_back_sharp),
                                    onPressed: () {
                                      ref
                                          .read(mapViewProvider.notifier)
                                          .setStopView();
                                      Navigator.pop(context);
                                    },
                                    tooltip: MaterialLocalizations.of(context)
                                        .openAppDrawerTooltip,
                                  );
                                },
                              ),
                              title: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                    '${stop.routeStop.route.destination} via ${stop.routeStop.route.pathName}'
                                        .toUpperCase(),
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ),
                              backgroundColor:
                                  Theme.of(context).primaryColorDark,
                            ),
                            body: RouteMap(
                              directedRoute: stop.routeStop.route,
                              initialLocation: stop.routeStop.location,
                              stops: [stop],
                            ))),
                  );
                },
                child: const Text("see route")),
          )
      ],
    );
  }
}
