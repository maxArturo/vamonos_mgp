import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/directed_routes_page/widget.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/list_card.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/route_card/widget.dart';

class RouteCardView extends WidgetView<RouteCard, RouteCardController> {
  const RouteCardView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return PanelListCard(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: Text(
                        '${widget.routeName} - directed routes'.toUpperCase(),
                        style: const TextStyle(color: Colors.white)),
                    backgroundColor: Theme.of(context).primaryColorDark,
                  ),
                  body: DirectedRoutesPage(
                      directedRouteStops:
                          widget.data.directedRouteData.values.toList()),
                )));
      },
      bottomRowText:
          "${widget.data.directedRouteData.keys.length} available directions",
      topRowText: "route:${widget.routeName}",
      color: getCardColor(widget.routeName),
    );
  }

  getCardColor(String routeName) =>
      Colors.primaries[routeName.hashCode % Colors.primaries.length];
}
