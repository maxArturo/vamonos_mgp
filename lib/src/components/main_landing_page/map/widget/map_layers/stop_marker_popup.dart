import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/services/mgp_route/stop_arrivals/stop_arrivals_provider.dart';

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
        children: [
          Text("Route Name: ${stop.routeStop.route.name}\n"
              "Route ID: ${stop.routeStop.route.id}\n"
              "Stop Name: ${stop.routeStop.description}"),
          arrivals.maybeWhen(
              data: (arrivalData) => arrivalData.fold(
                  (l) => const Text(
                        "An unexpected error occurred",
                        key: Key('error'),
                        style: TextStyle(color: Colors.red),
                      ),
                  (r) => Text(r[0].arrival)),
              loading: () => const Center(child: Text("Loading arrival...")),
              orElse: () => const Text(
                    "An unexpected error occurred",
                    key: Key('error'),
                    style: TextStyle(color: Colors.red),
                  ))
        ],
      ),
    );
  }
}
