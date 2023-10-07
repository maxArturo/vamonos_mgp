import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/error_sink.dart';
import 'package:vamonos_mgp/src/components/home/panel_controller/scroll_controller_provider.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/directed_routes_page/view.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/models.dart';
import 'package:vamonos_mgp/src/util/errors.dart';
import 'package:vamonos_mgp/src/util/fn.dart';

class DirectedRoutesPage extends ConsumerStatefulWidget {
  final List<RouteStopMarker> directedRouteMarkers;

  const DirectedRoutesPage({required this.directedRouteMarkers, super.key});

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
        error: (error, stackTrace) => errorSink(castOrFallback(
            error,
            DataNotFoundError(
                description: "no panel controller yet",
                stackTrace: stackTrace))),
        orElse: () => const Text("no panel controller yet"));
  }
}
