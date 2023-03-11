// generates a single SizedBox representing a transportation line
// in the expanding drawer.
import 'package:automatic_animated_list/automatic_animated_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/widget_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/panel_controller/panel_controller_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/route_card/widget.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

class RoutesNearYouListView extends StatelessWidget {
  final Either<AppError, List<DirectedRoute>> routeData;
  final ScrollController scrollController;

  const RoutesNearYouListView(this.scrollController,
      {super.key, required this.routeData});

  @override
  Widget build(BuildContext context) {
    return routeData.fold(
        (err) => Text("An error of type ${err.error} occurred"), (routes) {
      return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Builder(
              key: ValueKey(routes.isEmpty),
              builder: (BuildContext context) {
                if (routes.isEmpty) {
                  return Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 30),
                            const Icon(
                              Icons.block_sharp,
                              size: 30,
                              color: Color.fromARGB(255, 194, 63, 63),
                            ),
                            const SizedBox(height: 30),
                            Text("No routes near you".toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 30)),
                          ],
                        ),
                        const SizedBox(width: 13),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...header(),
                      Flexible(
                        child: AutomaticAnimatedList(
                          items: routes,
                          controller: scrollController,
                          keyingFunction: (DirectedRoute item) => Key(item.id),
                          itemBuilder: (BuildContext context,
                              DirectedRoute item, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: SizeTransition(
                                sizeFactor: CurvedAnimation(
                                    parent: animation, curve: Curves.easeInOut),
                                child: _lineGenerator(item),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              }),
        ),
      );
    });
  }
}

RouteCard _lineGenerator(DirectedRoute route) {
  return RouteCard(route: route);
}

header() => [
      const SizedBox(
        height: 12.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(Radius.circular(12.0))),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("routes near you".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
    ];
