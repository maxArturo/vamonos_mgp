// generates a single SizedBox representing a transportation line
// in the expanding drawer.
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
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
        child: ListView.builder(
            controller: scrollController,
            itemCount: routes.length + 1,
            itemBuilder: (context, idx) {
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
              }
              if (idx == 0) {
                return Column(children: [
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12.0))),
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
                  )
                ]);
              } else {
                return _lineGenerator(routes[idx - 1]);
              }
            }),
      );
    });
  }
}

SizedBox _lineGenerator(DirectedRoute route) {
  final color = Colors.primaries[route.hashCode % Colors.primaries.length];

  return SizedBox(
    width: double.infinity,
    child: MaterialButton(
      onPressed: () {},
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
                  Text("route ${route.id}".toUpperCase(),
                      style: const TextStyle(color: Colors.white)),
                  Text(route.direction.toUpperCase(),
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(width: 13),
              const Icon(Icons.directions_bus_filled_sharp,
                  color: Colors.white),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}
