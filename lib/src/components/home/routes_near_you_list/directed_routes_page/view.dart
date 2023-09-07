import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/map/default_reset_map_button.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/directed_routes_page/directed_routes_card/widget.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/directed_routes_page/widget.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';

class DirectedRoutesPageView extends ConsumerWidgetView<DirectedRoutesPage,
    DirectedRoutesPageController> {
  final ScrollController scrollController;
  const DirectedRoutesPageView(super.state,
      {super.key, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: ListView.builder(
          controller: scrollController,
          itemCount: widget.directedRouteMarkers.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            if (widget.directedRouteMarkers.isEmpty) {
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
                      Text("No hay rutas cercanas".toUpperCase(),
                          style: const TextStyle(color: Colors.white)),
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
            final directedRouteMarker = widget.directedRouteMarkers[index];
            return DirectedRouteCard(stopAndMarker: directedRouteMarker);
          },
        )),
      ],
    );
  }
}
