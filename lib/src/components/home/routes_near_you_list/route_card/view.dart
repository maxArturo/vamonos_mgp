import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/directed_routes_page/widget.dart';
import 'package:vamonos_mgp/src/components/common/list_card.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/route_card/widget.dart';

class RouteCardView extends WidgetView<RouteCard, RouteCardController> {
  const RouteCardView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListCard(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(widget.data.routeName.toUpperCase(),
                          style: const TextStyle(color: Colors.white)),
                    ),
                    backgroundColor: Theme.of(context).primaryColorDark,
                  ),
                  backgroundColor: Colors.blueGrey,
                  body: DirectedRoutesPage(
                      directedRouteStops:
                          widget.data.closestStopsByUniqueDirection),
                )));
      },
      topRowText: widget.data.routeName,
    );
  }
}
