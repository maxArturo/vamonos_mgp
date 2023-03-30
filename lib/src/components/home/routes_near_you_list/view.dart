import 'package:automatic_animated_list/automatic_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/models.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/route_card/widget.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/routes_provider.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/widget.dart';
import 'package:vamonos_mgp/src/services/mgp_route/route_list/route_list_provider.dart';
import 'package:vamonos_mgp/src/util/extensions/riverpod.dart';

class RoutesSection extends ConsumerWidget {
  final ScrollController sc;
  const RoutesSection({super.key, required this.sc});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, child) {
      final provider = ref.watch(routeStopMapMarkersNearYouProvider);
      return provider.fold(
          data: (r) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Builder(
                    key: ValueKey(r.isEmpty),
                    builder: (BuildContext context) {
                      if (r.isEmpty) {
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
                                  Text(
                                      "No hay rutas en esta area".toUpperCase(),
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
                        r.sort((a, b) => a.routeName.compareTo(b.routeName));
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: AutomaticAnimatedList(
                                items: r,
                                controller: sc,
                                keyingFunction: (route) => Key(route.routeName),
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
                                          routeName: routeCardData.routeName),
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
          error: (l) => Text(
                l.userText,
                style: const TextStyle(color: Colors.red),
              ),
          loading: () => Center(
                key: UniqueKey(),
                child: const CircularProgressIndicator(),
              ));
    });
  }
}

class RoutesNearYouListView
    extends ConsumerWidgetView<RoutesNearYouList, RoutesNearYouListController> {
  const RoutesNearYouListView(super.state, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO revisit nested consumer if performance is impacted
    final provider = ref.watch(routeStopMapMarkersNearYouProvider);
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: provider.fold(
          data: (r) =>
              Center(key: const Key('data'), child: mainRoutePage(context, r)),
          error: (l) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.warning_amber,
                color: Colors.redAccent,
              ),
              const SizedBox.shrink(),
              Text(
                l.userText,
                style: const TextStyle(color: Colors.redAccent, fontSize: 18),
              ),
              FilledButton(
                  onPressed: () => ref.refresh(latestRouteListProvider),
                  child: const Text("Pulsa para reintentar"))
            ],
          ),
          loading: () => Center(
            key: UniqueKey(),
            child: const CircularProgressIndicator(),
          ),
        ));
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
                    backgroundColor: Colors.blueGrey,
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      title: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('rutas cercanas'.toUpperCase(),
                            style: const TextStyle(color: Colors.white)),
                      ),
                      backgroundColor: Theme.of(context).primaryColorDark,
                    ),
                    body: RoutesSection(sc: widget.scrollController),
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
