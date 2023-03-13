import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/directed_routes_page/directed_routes_card/widget.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/list_card.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/route_stops_page/widget.dart';

class DirectedRouteCardView
    extends WidgetView<DirectedRouteCard, DirectedRouteCardController> {
  const DirectedRouteCardView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return PanelListCard(
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
                  body: RouteStopsPage(stops: widget.stops))));
        },
        bottomRowText: "${widget.stops.length} available stops",
        topRowText:
            "${widget.directedRoute.destination} Via ${widget.directedRoute.pathName}",
        color: getCardColor(widget.directedRoute.canonicalIdentifier));
  }

  getCardColor(String routeName) =>
      Colors.primaries[routeName.hashCode % Colors.primaries.length];
}
