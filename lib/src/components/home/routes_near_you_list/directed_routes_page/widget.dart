import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/home/panel_controller/scroll_controller_provider.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/directed_routes_page/view.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';

/// This widget is the body in a [MaterialPageRoute] rendered in the sliding up
/// panel of the "near you" map page. It appears when a [RouteCard] has been
/// tapped.
class DirectedRoutesPage extends ConsumerStatefulWidget {
  final List<RouteStop> directedRouteStops;

  const DirectedRoutesPage({required this.directedRouteStops, super.key});

  @override
  ConsumerState<DirectedRoutesPage> createState() =>
      DirectedRoutesPageController();
}

class DirectedRoutesPageController extends ConsumerState<DirectedRoutesPage> {
  late ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ref.watch(panelScrollControllerProvider).maybeWhen(
        data: (sc) => DirectedRoutesPageView(
              this,
              scrollController: sc,
            ),
        orElse: () => const Text("no panel controller yet"));
  }
}
