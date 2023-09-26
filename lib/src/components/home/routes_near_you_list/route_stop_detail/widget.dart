import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';
import 'package:vamonos_mgp/src/components/home/panel_controller/scroll_controller_provider.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/route_stop_detail/view.dart';

class RouteStopDetail extends ConsumerStatefulWidget {
  final StopMarker marker;
  const RouteStopDetail({super.key, required this.marker});

  @override
  ConsumerState<RouteStopDetail> createState() => RouteStopDetailController();
}

class RouteStopDetailController extends ConsumerState<RouteStopDetail> {
  late ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ref.watch(panelScrollControllerProvider).maybeWhen(
        data: (sc) => RouteStopDetailView(
              this,
              sc: sc,
            ),
        orElse: () => const Text("no panel controller yet"));
  }
}
