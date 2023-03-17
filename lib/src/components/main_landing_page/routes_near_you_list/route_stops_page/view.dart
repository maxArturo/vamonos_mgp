import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/widget_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/list_card.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/route_stops_page/widget.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';

class RouteStopsPageView
    extends WidgetView<RouteStopsPage, RouteStopsPageController> {
  final ScrollController scrollController;
  const RouteStopsPageView(super.state,
      {super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: ListView.builder(
          controller: scrollController,
          itemCount: widget.stops.length,
          itemBuilder: (BuildContext context, int index) {
            if (widget.stops.isEmpty) {
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
                      Text("No stops near you".toUpperCase(),
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(width: 13),
                ],
              );
            }

            final stop = widget.stops[index];
            return Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return PanelListCard(
                  onPressed: () {
                    ref
                        .read(stopViewMapControllerProvider.notifier)
                        .updateMapLocation(stop.routeStop.location);
                    ref.read(popupControllerProvider).showPopupsOnlyFor([stop]);
                  },
                  bottomRowText: "Name: ${stop.stopName}",
                  topRowText: "ID: ${stop.routeStop.id}",
                  color: getCardColor(stop.routeStop.id));
            });
          },
        )),
      ],
    );
  }

  getCardColor(String stopName) =>
      Colors.primaries[stopName.hashCode % Colors.primaries.length];
}
