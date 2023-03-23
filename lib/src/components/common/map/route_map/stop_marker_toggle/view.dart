import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/map/route_map/stop_marker_toggle/widget.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/services/map/map_view_provider.dart';

class StopMarkerToggleView
    extends WidgetView<StopMarkerToggle, StopMarkerToggleController> {
  const StopMarkerToggleView(
    super.state, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 40,
      child: Consumer(builder: (context, ref, child) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: ColoredBox(
            color: const Color(0xCCFFFFFF),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Show all stops",
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(color: Color.fromARGB(255, 67, 59, 59)),
                        ),
                        Switch(
                          thumbIcon: state.checkIcon,
                          value:
                              ref.watch(routeMapViewStateProvider).showAllStops,
                          onChanged: (bool value) {
                            ref
                                .read(routeMapViewStateProvider.notifier)
                                .toggleAllStops();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        // return Switch(
        //   thumbIcon: state.checkIcon,
        //   value: ref.watch(routeMapViewStateProvider).showAllStops,
        //   onChanged: (bool value) {
        //     ref.read(routeMapViewStateProvider.notifier).toggleAllStops();
        //   },
        // );
      }),
    );
  }
}
