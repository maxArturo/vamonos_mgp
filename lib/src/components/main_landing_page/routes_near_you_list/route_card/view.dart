import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:page_view_indicators/arrow_page_indicator.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers_provider.dart';
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
      return Stack(
        children: [
          ArrowPageIndicator(
              currentPageNotifier: state.valueNotifier,
              itemCount: 2,
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
                  itemCount: 2, currentPageNotifier: state.valueNotifier),
            ),
          )
        ],
      );
    });
  }

  pageView(BuildContext context, WidgetRef ref, ValueNotifier notifier) {
    final color =
        Colors.primaries[widget.route.hashCode % Colors.primaries.length];
    final relevantRouteStops =
        ref.watch(markersWithinMapBoundsProvider(widget.route));
    return SizedBox(
      height: 80,
      child: PageView(
        onPageChanged: (value) {
          debugPrint("flipped page to $value");
          notifier.value = value;
        },
        children: [
          MaterialButton(
            onPressed: () {
              debugPrint("route list card got pressed");
              ref.read(popupControllerProvider).hideAllPopups();
              ref.read(panelControllerProvider).animatePanelToPosition(0.2,
                  duration: const Duration(milliseconds: 300));

              relevantRouteStops.whenData((res) => res.map((stopMarkers) {
                    ref
                        .read(popupControllerProvider)
                        .showPopupsOnlyFor(stopMarkers);
                    ref
                        .read(mapControllerServiceProvider.future)
                        .then((mc) => mc.move(
                            // FIXME stopMarkers can be empty!
                            LatLng.fromJson({
                              "latitude":
                                  stopMarkers.first.landmark.location.latitude,
                              "longitude":
                                  stopMarkers.first.landmark.location.longitude
                            }),
                            16));
                  }));
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
                        Text("route ${widget.route.name}".toUpperCase(),
                            style: const TextStyle(color: Colors.white)),
                        Text(widget.route.direction.toUpperCase(),
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
          ),
          const Center(
            child: Text('Second Page'),
          ),
        ],
      ),
    );
  }
}
