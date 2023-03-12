import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_view_indicators/arrow_page_indicator.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/widget_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/panel_controller/panel_controller_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/route_card/widget.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';

class RouteCardView extends WidgetView<RouteCard, RouteCardController> {
  const RouteCardView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      if (widget.markerList.isEmpty) {
        return const SizedBox(
            height: 80,
            child: Center(
                child: Text("tried to create a route list with no stops!")));
      }

      return Stack(
        children: [
          ArrowPageIndicator(
              currentPageNotifier: state.valueNotifier,
              itemCount: widget.markerList.length,
              pageController: state.pageController,
              isInside: true,
              child: pageView(context, ref, state.valueNotifier)),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CirclePageIndicator(
                  itemCount: widget.markerList.length,
                  currentPageNotifier: state.valueNotifier),
            ),
          )
        ],
      );
    });
  }

  pageView(BuildContext context, WidgetRef ref, ValueNotifier notifier) {
    final color = Colors.primaries[
        widget.markerList.first.routeStop.route.id.hashCode %
            Colors.primaries.length];
    return SizedBox(
      height: 80,
      child: PageView(
        onPageChanged: (value) => notifier.value = value,
        children: [
          ...widget.markerList
              .map((marker) => singleStopCard(marker, ref, color))
              .toList(),
        ],
      ),
    );
  }

  getCardColor(StopMarker marker) => Colors
      .primaries[marker.routeStop.route.id.hashCode % Colors.primaries.length];

  singleStopCard(StopMarker marker, WidgetRef ref, Color color) =>
      MaterialButton(
        onPressed: () {
          ref.read(popupControllerProvider).hideAllPopups();
          ref.read(panelControllerProvider).animatePanelToPosition(0.2,
              duration: const Duration(milliseconds: 300));

          ref.read(popupControllerProvider).showPopupsOnlyFor([marker]);

          ref
              .read(mapControllerServiceProvider.future)
              .then((mc) => mc.move(marker.point, 16));
        },
        color: color,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                        "route:${marker.routeStop.route.name} - direction: ${marker.routeStop.route.destination} via ${marker.routeStop.route.pathName}"
                            .toUpperCase(),
                        style: const TextStyle(color: Colors.white)),
                    Text("route id: ${marker.routeStop.route.id}".toUpperCase(),
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
                const Icon(Icons.directions_bus_filled_sharp,
                    size: 24, color: Colors.white),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
}
