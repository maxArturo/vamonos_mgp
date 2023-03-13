import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/panel_controller/scroll_controller_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/route_stops_page/view.dart';

class RouteStopsPage extends ConsumerStatefulWidget {
  final List<StopMarker> stops;

  const RouteStopsPage({required this.stops, super.key});

  @override
  ConsumerState<RouteStopsPage> createState() => RouteStopsPageController();
}

class RouteStopsPageController extends ConsumerState<RouteStopsPage> {
  @override
  Widget build(BuildContext context) {
    final sc = ref.watch(panelScrollControllerProvider);
    return sc.fold(
        () => const Text("no panel controller yet"),
        (sc) => RouteStopsPageView(
              this,
              scrollController: sc,
            ));
  }
}
