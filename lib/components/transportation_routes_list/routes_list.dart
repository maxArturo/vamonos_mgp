import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vamonos_mgp/components/common/widget_view.dart';
import 'package:vamonos_mgp/entities/route.dart' as route_entity;
import 'package:vamonos_mgp/entities/route_stop.dart';
import 'package:vamonos_mgp/providers/routes.dart';

import '../../util/errors.dart';
import '../navigation/drawer.dart';
import '../navigation/menu_button.dart';

class MainRoutesPage extends StatelessWidget {
  const MainRoutesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const HomeDrawer(),
        floatingActionButton: const FloatingMenuButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Container(
          padding: MediaQuery.of(context).padding,
          child: const MainRoutesList(),
        ));
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
      children: [
        const SizedBox(height: 20),
        const Center(
            child: Text("All routes are here",
                style: TextStyle(
                  color: Colors.black,
                ))),
        const SizedBox(height: 20),
        Expanded(
          child: FutureProvider<dartz.Option<ViewInput>>(
            create: (context) => RouteProviderStore()
                .allRoutes()
                .then((value) => dartz.Some(value)),
            initialData: const dartz.None(),
            child: Consumer<dartz.Option<ViewInput>>(
                builder: (BuildContext context, value, Widget? child) =>
                    value.fold(
                      () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      (value) => value.fold((err) {
                        final errType = err.error;

                        return Text(
                          "An error of type $errType occurred",
                          style: const TextStyle(color: Colors.red),
                        );
                      },
                          (data) => ListView.builder(
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
                                          Text(
                                              "No routes near you"
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                      const SizedBox(width: 13),
                                    ],
                                  );
                                }

                                final routeName = data[idx].name;
                                return ListTile(
                                    title: Text("Route no: $routeName"));
                              })),
                    )),
          ),
        ),
      ],
    );
  }
}
