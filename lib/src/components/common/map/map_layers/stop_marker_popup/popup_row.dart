import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vamonos_mgp/src/components/common/error_sink.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/services/mgp_route/stop_arrivals/stop_arrivals_provider.dart';
import 'package:vamonos_mgp/src/util/extensions/riverpod.dart';

class StopPopupRow extends ConsumerWidget {
  final RouteStop stop;
  const StopPopupRow({super.key, required this.stop});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arrivals = ref.watch(stopArrivalsByStopProvider(stop: stop));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...arrivals.fold(
              data: (r) => [
                    Text("${stop.route.name} ${stop.route.destination}:"),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [r.first].map((stopArrival) {
                          if (stopArrival.nextArrivalInMinutes < 0) {
                            return const Text("No disponible en este momento");
                          }
                          if (stopArrival.nextArrivalInMinutes == 0) {
                            return const Text("Arribando");
                          }
                          return Text(
                              "${stopArrival.nextArrivalInMinutes} minutos");
                        }).toList()),
                  ],
              error: (err) => [
                    errorSink(err,
                        widget: Text(
                            "Arribo no disponible para ${stop.route.name}",
                            style: const TextStyle(color: Colors.red)))
                  ],
              loading: () => [
                    Text("${stop.route.name}: cargando arribos"),
                    const SpinKitWave(
                      color: Colors.blue,
                      size: 20,
                    )
                  ]),
        ],
      ),
    );
  }
}
