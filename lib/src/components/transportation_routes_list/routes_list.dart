import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/common/list_card.dart';
import 'package:vamonos_mgp/src/components/navigation/drawer.dart';
import 'package:vamonos_mgp/src/components/transportation_routes_list/directed_routes_page/widget.dart';
import 'package:vamonos_mgp/src/entities/route.dart' as route_entity;
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/services/mgp_route/route_list/route_list_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

class MainRoutesPage extends StatelessWidget {
  const MainRoutesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('routes near you'.toUpperCase(),
                style: const TextStyle(color: Colors.white)),
          ),
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
        drawer: const HomeDrawer(),
        body: const MainRoutesList());
  }
}

class MainRoutesList extends StatefulWidget {
  const MainRoutesList({super.key});

  @override
  State<MainRoutesList> createState() => MainRoutesListController();
}

class MainRoutesListController extends State<MainRoutesList> {
  List<RouteStop> routes = [];

  @override
  Widget build(BuildContext context) {
    return MainRoutesListView(this);
  }
}

typedef ViewInput = dartz.Either<AppError, List<route_entity.Route>>;

class MainRoutesListView
    extends WidgetView<MainRoutesList, MainRoutesListController> {
  const MainRoutesListView(super.state, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: Consumer(builder: (context, ref, child) {
            return ref.watch(latestRouteListProvider).maybeWhen(
                  data: (data) => data.fold((err) {
                    final errType = err.errorType;
                    return Text(
                      "An error of type $errType occurred",
                      style: const TextStyle(color: Colors.red),
                    );
                  },
                      (data) => RefreshIndicator(
                            onRefresh: () =>
                                ref.refresh(latestRouteListProvider.future),
                            child: ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: data.length,
                                itemBuilder: (context, idx) {
                                  if (data.isEmpty) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            const Icon(
                                              Icons.block_sharp,
                                              size: 30,
                                              color: Color.fromARGB(
                                                  255, 194, 63, 63),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                                    "No routes near you"
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        color: Colors.white)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 13),
                                      ],
                                    );
                                  }

                                  final routeName = data[idx].name;
                                  return ListCard(
                                      topRowText: routeName,
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => Scaffold(
                                                      appBar: AppBar(
                                                        title: FittedBox(
                                                          fit: BoxFit.fitWidth,
                                                          child: Text(
                                                              routeName
                                                                  .toUpperCase(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                        backgroundColor: Theme
                                                                .of(context)
                                                            .primaryColorDark,
                                                      ),
                                                      backgroundColor:
                                                          Colors.blueGrey,
                                                      body: DirectedRoutesPage(
                                                        route: data[idx],
                                                      ),
                                                    )));
                                      });
                                }),
                          )),
                  orElse: () => const Text(
                    "An unexpected error occurred",
                    style: TextStyle(color: Colors.red),
                  ),
                );
          }))
        ]);
  }
}
