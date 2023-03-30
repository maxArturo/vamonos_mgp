import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/map/route_map/stop_marker_toggle/widget.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/services/map/map_view_provider.dart';

class StopMarkerToggleView
    extends ConsumerWidgetView<StopMarkerToggle, StopMarkerToggleController> {
  const StopMarkerToggleView(
    super.state, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Padding(
        padding: const EdgeInsets.only(left: 3, right: 3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Mostrar todas las paradas",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Color.fromARGB(255, 67, 59, 59)),
            ),
            Switch(
              thumbIcon: state.checkIcon,
              value: ref.watch(routeMapViewStateProvider).showAllStops,
              onChanged: (bool value) {
                ref.read(routeMapViewStateProvider.notifier).toggleAllStops();
              },
            )
          ],
        ),
      ),
    );
  }
}
