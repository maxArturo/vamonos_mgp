import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vamonos_mgp/src/components/common/map/popup/popup_provider.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/directed_routes_page/directed_routes_card/widget.dart';
import 'package:vamonos_mgp/src/components/common/list_card.dart';
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
        ref.watch(stopArrivalsByStopProvider(stop: widget.stop.routeStop));
    return ListCard(
      onPressed: () {
        ref
            .read(stopViewMapControllerProvider.notifier)
            .updateMapLocation(widget.stop.routeStop.location);
        ref
            .watch(stopViewPopupControllerProvider)
            .showPopupsOnlyFor([widget.stop]);
      },
      bottomWidget: arrivals.fold(
        data: (r) => Text(r[0].arrival,
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
          return Text(
            errorMessage,
            key: const Key('error'),
            style: const TextStyle(color: Colors.red),
          );
        },
        loading: () => Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SpinKitWave(
              color: Colors.blue,
              size: 20,
            )
          ],
        ),
      ),
      topRowText:
          "${widget.stop.routeStop.route.destination} Via ${widget.stop.routeStop.route.pathName}",
    );
  }
}
