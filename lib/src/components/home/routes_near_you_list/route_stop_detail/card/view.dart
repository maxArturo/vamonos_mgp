import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vamonos_mgp/src/components/common/error_sink.dart';
import 'package:vamonos_mgp/src/components/common/list_card.dart';
import 'package:vamonos_mgp/src/components/common/map/route_map/widget.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/route_stop_detail/card/widget.dart';
import 'package:vamonos_mgp/src/services/map/map_view_provider.dart';
import 'package:vamonos_mgp/src/services/mgp_route/stop_arrivals/stop_arrivals_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';
import 'package:vamonos_mgp/src/util/extensions/riverpod.dart';

class RouteStopCardView
    extends ConsumerWidgetView<RouteStopCard, RouteStopCardController> {
  const RouteStopCardView(super.state, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arrivals =
        ref.watch(stopArrivalsByStopProvider(stop: widget.routeStop));

    return ListCard(
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
                            ref.read(mapViewProvider.notifier).setStopView();
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
                          '${widget.routeStop.route.destination} Por ${widget.routeStop.route.pathName}'
                              .toUpperCase(),
                          style: const TextStyle(color: Colors.white)),
                    ),
                    backgroundColor: Theme.of(context).primaryColorDark,
                  ),
                  body: RouteMap(
                    directedRoute: widget.routeStop.route,
                    initialLocation: widget.routeStop.location,
                    selectedMarker: widget.marker,
                  ))),
        );
      },
      topRowText:
          "${widget.routeStop.route.name} ${widget.routeStop.route.pathName}",
    );
  }
}
