import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/list_card.dart';
import 'package:vamonos_mgp/src/components/common/map/route_map/widget.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/transportation_routes_list/directed_routes_page/card/widget.dart';

class DirectedRouteCardView
    extends ConsumerWidgetView<DirectedRouteCard, DirectedRouteCardController> {
  const DirectedRouteCardView(super.state, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListCard(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              maintainState: false,
              builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                          '${widget.directedRoute.destination} Via ${widget.directedRoute.pathName}'
                              .toUpperCase(),
                          style: const TextStyle(color: Colors.white)),
                    ),
                    backgroundColor: Theme.of(context).primaryColorDark,
                  ),
                  body: RouteMap(
                    directedRoute: widget.directedRoute,
                  ))),
        );
      },
      topRowText:
          "${widget.directedRoute.destination} Via ${widget.directedRoute.pathName}",
    );
  }
}
