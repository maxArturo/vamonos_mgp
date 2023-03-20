import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/home/panel_controller/scroll_controller_provider.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/directed_routes_page/view.dart';

class DirectedRoutesPage extends ConsumerStatefulWidget {
  final List<StopMarker> directedRouteStops;

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
