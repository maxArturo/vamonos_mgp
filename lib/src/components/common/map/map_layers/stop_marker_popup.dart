import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vamonos_mgp/src/components/common/map/route_map/widget.dart';
import 'package:vamonos_mgp/src/entities/map_browser_view.dart';
import 'package:vamonos_mgp/src/services/map/map_view_provider.dart';
import 'package:vamonos_mgp/src/services/map/markers/marker.dart';
import 'package:vamonos_mgp/src/services/mgp_route/stop_arrivals/stop_arrivals_provider.dart';
import 'package:vamonos_mgp/src/services/route_stop_provider.dart';
import 'package:vamonos_mgp/src/util/extensions/riverpod.dart';

class StopMarkerPopup extends ConsumerWidget {
  final StopMarker marker;
  const StopMarkerPopup({required this.marker, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arrivals = ref.watch(arrivalsByMarkerProvider(marker: marker));

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...arrivals.fold(
            data: (r) => [
                  Flexible(child: Text("Ruta: ${r[0].stop.route.name}\n")),
                  Flexible(child: Text(r[0].arrival)),
                ],
            error: (l) {
              return const [
                Text(
                  "Arribo no disponible",
                  key: Key('error'),
                  style: TextStyle(color: Colors.red),
                )
              ];
            },
            loading: () => const [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SpinKitWave(
                          color: Colors.blue,
                          size: 20,
                        )
                      ],
                    ),
                  )
                ]),
        if (ref.watch(mapViewProvider) == MapBrowserView.stopView)
          StopToRouteViewWidget(
            marker: marker,
          )
      ],
    );
  }
}

class StopToRouteViewWidget extends ConsumerWidget {
  final StopMarker marker;
  const StopToRouteViewWidget({super.key, required this.marker});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeStore = ref.watch(findRouteStopByMarkerMGPProvider(marker));
    return routeStore.fold(
      data: (routeStop) => Flexible(
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
                                '${routeStop.route.destination} Por ${routeStop.route.pathName}'
                                    .toUpperCase(),
                                style: const TextStyle(color: Colors.white)),
                          ),
                          backgroundColor: Theme.of(context).primaryColorDark,
                        ),
                        body: RouteMap(
                          directedRoute: routeStop.route,
                          initialLocation: routeStop.location,
                          selectedMarker: marker,
                        ))),
              );
            },
            child: const Text("Ver ruta")),
      ),
      loading: () => const SizedBox.shrink(), // empty widget
      error: (_) => const SizedBox.shrink(), // empty widget
    );
  }
}
