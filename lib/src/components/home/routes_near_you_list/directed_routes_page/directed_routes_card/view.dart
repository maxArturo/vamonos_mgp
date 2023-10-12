import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vamonos_mgp/src/components/common/error_sink.dart';
import 'package:vamonos_mgp/src/components/common/list_card.dart';
import 'package:vamonos_mgp/src/components/common/map/route_map/widget.dart';
import 'package:vamonos_mgp/src/components/common/navigation/home_navkey_provider.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/directed_routes_page/directed_routes_card/widget.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';
import 'package:vamonos_mgp/src/services/mgp_route/stop_arrivals/stop_arrivals_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';
import 'package:vamonos_mgp/src/util/extensions/riverpod.dart';

class DirectedRouteCardView
    extends ConsumerWidgetView<DirectedRouteCard, DirectedRouteCardController> {
  const DirectedRouteCardView(super.state, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arrivals =
        ref.watch(stopArrivalsByStopProvider(stop: widget.stopAndMarker.stop));
    return ListCard(
      onPressed: () {
        final stop = widget.stopAndMarker.stop;
        final marker = widget.stopAndMarker.marker;
        ref
            .read(stopViewMapControllerProvider.notifier)
            .updateMapLocation(stop.location);

        // make sure the marker is zoomed in all the way
        // ref.read(stopViewMapControllerProvider.notifier).setZoom(18);

        ref.read(homeNavkeyProvider).whenData((key) {
          key.currentState?.push(
            MaterialPageRoute(
                maintainState: false,
                builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                            '${stop.route.destination} por ${stop.route.pathName}'
                                .toUpperCase(),
                            style: const TextStyle(color: Colors.white)),
                      ),
                      backgroundColor: Theme.of(context).primaryColorDark,
                    ),
                    body: RouteMap(
                      directedRoute: stop.route,
                      initialLocation: stop.location,
                      initalZoom: 16.0,
                      selectedMarker: marker,
                    ))),
          );
        });
      },
      bottomWidget: arrivals.fold(
        data: (r) => Text("${r[0].nextArrivalInMinutes} minutos",
            style: const TextStyle(color: Colors.white, fontSize: 20)),
        error: (l) {
          String errorMessage;
          switch (l.errorType) {
            case ErrorType.dataNotFoundError:
              errorMessage = "Datos no disponibles para esta ruta";
              break;

            default:
              errorMessage = "Arribo no disponible en este momento";
          }
          return errorSink(l,
              widget: Text(
                errorMessage,
                key: const Key('error'),
                style: const TextStyle(color: Colors.red),
              ));
        },
        loading: () => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpinKitWave(
              color: Colors.blue,
              size: 20,
            )
          ],
        ),
      ),
      topRowText:
          "${widget.stopAndMarker.stop.route.destination} Via ${widget.stopAndMarker.stop.route.pathName}",
    );
  }
}
