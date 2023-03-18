import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/directed_routes_page/directed_routes_card/widget.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/directed_routes_page/widget.dart';

class DirectedRoutesPageView
    extends WidgetView<DirectedRoutesPage, DirectedRoutesPageController> {
  final ScrollController scrollController;
  const DirectedRoutesPageView(super.state,
      {super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: ListView.builder(
          controller: scrollController,
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
            final stopMarker = widget.directedRouteStops[index];
            return DirectedRouteCard(stop: stopMarker);
          },
        )),
      ],
    );
  }
}
