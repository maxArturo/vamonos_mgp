import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/route_card/widget.dart';

class RouteCardView extends WidgetView<RouteCard, RouteCardController> {
  const RouteCardView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80, width: double.infinity, child: singleStopCard());
  }

  getCardColor(String routeName) =>
      Colors.primaries[routeName.hashCode % Colors.primaries.length];

  singleStopCard() => MaterialButton(
        color: getCardColor(widget.routeName),
        onPressed: () {},
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("route:${widget.routeName}".toUpperCase(),
                        style: const TextStyle(color: Colors.white)),
                    Text(
                        "${widget.directedRoutes.keys.length} available directions"
                            .toUpperCase(),
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
