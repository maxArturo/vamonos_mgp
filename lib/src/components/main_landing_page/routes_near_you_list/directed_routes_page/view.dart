import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/panel_controller/scroll_controller_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/directed_routes_page/directed_routes_card/widget.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/directed_routes_page/widget.dart';

class DirectedRoutesPageView
    extends WidgetView<DirectedRoutesPage, DirectedRoutesPageController> {
  const DirectedRoutesPageView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            // TODO check if I really need a scrollcontroller here
            // otherwise delte lib/src/components/main_landing_page/panel_controller/scroll_controller_provider.dart
            child: ListView.builder(
          itemCount: widget.directedRouteStops.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            if (widget.directedRouteStops.isEmpty) {
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
                      Text("No routes near you".toUpperCase(),
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(width: 13),
                ],
              );
            }

            final directedRoute =
                widget.directedRouteStops[index][0].routeStop.route;
            return DirectedRouteCard(
                directedRoute: directedRoute,
                stops: widget.directedRouteStops[index]);
          },
        )),
      ],
    );
  }
}
