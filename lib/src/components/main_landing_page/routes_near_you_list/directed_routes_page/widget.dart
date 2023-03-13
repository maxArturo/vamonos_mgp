import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/panel_controller/scroll_controller_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/directed_routes_page/view.dart';

class DirectedRoutesPage extends ConsumerStatefulWidget {
  final List<List<StopMarker>> directedRouteStops;

  const DirectedRoutesPage({required this.directedRouteStops, super.key});

  @override
  ConsumerState<DirectedRoutesPage> createState() =>
      DirectedRoutesPageController();
}

class DirectedRoutesPageController extends ConsumerState<DirectedRoutesPage> {
  late ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final sc = ref.watch(panelScrollControllerProvider);
    return sc.fold(
        () => const Text("no panel controller yet"),
        (sc) => DirectedRoutesPageView(
              this,
              scrollController: sc,
            ));
  }
}
