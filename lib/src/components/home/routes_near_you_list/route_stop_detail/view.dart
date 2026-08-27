import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/map/default_reset_map_button.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/route_stop_detail/card/widget.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/route_stop_detail/widget.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_event_provider.dart';

class RouteStopDetailView
    extends ConsumerWidgetView<RouteStopDetail, RouteStopDetailController> {
  final ScrollController sc;
  const RouteStopDetailView(super.state, {super.key, required this.sc});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(stopMapOnEndEventStreamProvider, ((previous, next) async {
      next.whenData((value) {
        if (previous != null) {
          previous.whenData((prev) {
            if (prev.center != value.center) {
              while (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            }
          });
        }
      });
    }));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const FittedBox(
          fit: BoxFit.fitWidth,
          child: Text('PARADAS', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                child: ListView.builder(
              controller: sc,
              itemCount: widget.marker.routeStops.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                if (widget.marker.routeStops.isEmpty) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.block_sharp,
                            size: 30,
                            color: Color.fromARGB(255, 194, 63, 63),
                          ),
                          const Text("NO HAY RUTAS EN ESTE PARADERO",
                              style: TextStyle(color: Colors.white)),
                          const SizedBox(height: 15),
                          DefaultResetMapbutton(
                              recenterLocation: ref
                                  .watch(stopViewMapControllerProvider.notifier)
                                  .resetMapLocation)
                        ],
                      ),
                      const SizedBox(width: 13),
                    ],
                  );
                }
                final routeStop = widget.marker.routeStops[index];
                return RouteStopCard(
                    routeStop: routeStop, marker: widget.marker);
              },
            )),
          ],
        );
      }),
    );
  }
}
