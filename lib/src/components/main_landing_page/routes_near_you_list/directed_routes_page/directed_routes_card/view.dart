import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/directed_routes_page/directed_routes_card/widget.dart';

class DirectedRouteCardView
    extends WidgetView<DirectedRouteCard, DirectedRouteCardController> {
  const DirectedRouteCardView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        width: double.infinity,
        child: MaterialButton(
          color: getCardColor(widget.directedRoute.canonicalIdentifier),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text(
                          '${widget.directedRoute.destination} Via ${widget.directedRoute.pathName}'
                              .toUpperCase(),
                          style: const TextStyle(color: Colors.white)),
                      backgroundColor: Theme.of(context).primaryColorDark,
                    ),
                    body: Text("hello from ${widget.stops.length}  stops"))));
            // body: DirectedRoutesPage(directedRouteStops: [],))));
          },
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
                          "${widget.directedRoute.destination} Via ${widget.directedRoute.pathName}"
                              .toUpperCase(),
                          style: const TextStyle(color: Colors.white)),
                      Text(
                          "${widget.stops.length} available stops"
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
        ));
  }

  getCardColor(String routeName) =>
      Colors.primaries[routeName.hashCode % Colors.primaries.length];
}
