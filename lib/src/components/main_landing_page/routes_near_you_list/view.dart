import 'package:automatic_animated_list/automatic_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/models.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/route_card/widget.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/routes_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/widget.dart';

class RoutesNearYouListView
    extends WidgetView<RoutesNearYouList, RoutesNearYouListController> {
  const RoutesNearYouListView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO revisit nested consumer if performance is impacted
    return Consumer(builder: (context, ref, child) {
      final provider = ref.watch(routeStopMapMarkersNearYouProvider);
      return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: provider.maybeWhen(
              data: (data) {
                return data.fold(
                    (l) => const Text(
                          "An unexpected error occurred",
                          key: Key('error'),
                          style: TextStyle(color: Colors.red),
                        ),
                    (r) => Center(
                        key: const Key('data'),
                        child: mainRoutePage(context, r)));
              },
              loading: () => const Center(
                    key: Key('loading'),
                    child: CircularProgressIndicator(),
                  ),
              orElse: () => const Text(
                    "An unexpected error occurred",
                    key: Key('error'),
                    style: TextStyle(color: Colors.red),
                  )));
    });
  }

  Widget routesSection() {
    return Consumer(builder: (context, ref, child) {
      final provider = ref.watch(routeStopMapMarkersNearYouProvider);
      return provider.maybeWhen(
          data: (data) {
            return data.fold(
                (l) => const Text(
                      "An unexpected error occurred",
                      style: TextStyle(color: Colors.red),
                    ),
                (r) => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Builder(
                          key: ValueKey(r.isEmpty),
                          builder: (BuildContext context) {
                            if (r.isEmpty) {
                              return Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        const SizedBox(height: 30),
                                        const Icon(
                                          Icons.block_sharp,
                                          size: 30,
                                          color:
                                              Color.fromARGB(255, 194, 63, 63),
                                        ),
                                        const SizedBox(height: 30),
                                        Text("No routes near you".toUpperCase(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                            )),
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
                                  Flexible(
                                    child: AutomaticAnimatedList(
                                      items: r,
                                      controller: widget.scrollController,
                                      keyingFunction: (route) => Key(
                                          "${route.routeName}_${route.directedRouteData.keys.length}"),
                                      itemBuilder: (BuildContext context,
                                          routeCardData,
                                          Animation<double> animation) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: SizeTransition(
                                            sizeFactor: CurvedAnimation(
                                                parent: animation,
                                                curve: Curves.easeInOut),
                                            child: RouteCard(
                                                data: routeCardData,
                                                routeName:
                                                    routeCardData.routeName),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }
                          }),
                    ));
          },
          orElse: () => const Text(
                "An unexpected error occurred",
                key: Key('error'),
                style: TextStyle(color: Colors.red),
              ));
    });
  }

  Widget mainRoutePage(BuildContext context, List<RouteCardData> data) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Navigator(
        initialRoute: '/',
        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (context) => Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      title: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('routes near you'.toUpperCase(),
                            style: const TextStyle(color: Colors.white)),
                      ),
                      backgroundColor: Theme.of(context).primaryColorDark,
                    ),
                    body: routesSection(),
                  );
              break;
            default:
              throw UnimplementedError();
          }
          return MaterialPageRoute(maintainState: false, builder: builder);
        },
      ),
    );
  }
}
