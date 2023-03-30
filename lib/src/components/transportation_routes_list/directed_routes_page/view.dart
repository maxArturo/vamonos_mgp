import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/transportation_routes_list/directed_routes_page/card/widget.dart';
import 'package:vamonos_mgp/src/components/transportation_routes_list/directed_routes_page/widget.dart';
import 'package:vamonos_mgp/src/entities/route.dart';

class DirectedRoutesPageView
    extends WidgetView<DirectedRoutesPage, DirectedRoutesPageController> {
  final List<DirectedRoute> directedRoutes;
  const DirectedRoutesPageView(super.state,
      {super.key, required this.directedRoutes});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: ListView.builder(
          itemCount: directedRoutes.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            if (directedRoutes.isEmpty) {
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
                      Text(
                          "No se encontraron direcciones de ruta".toUpperCase(),
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(width: 13),
                ],
              );
            }

            return DirectedRouteCard(directedRoute: directedRoutes[index]);
          },
        )),
      ],
    );
  }
}
