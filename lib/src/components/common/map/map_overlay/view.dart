import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/map/map_overlay/widget.dart';
import 'package:vamonos_mgp/src/components/common/map/route_map/stop_marker_toggle/widget.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/entities/map_browser_view.dart';
import 'package:vamonos_mgp/src/services/map/map_view_provider.dart';

class MapOverlayView
    extends ConsumerWidgetView<MapOverlay, MapOverlayController> {
  const MapOverlayView(
    super.state, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 40,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: ColoredBox(
          color: const Color(0xCCFFFFFF),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (ref.watch(mapOverlayStateProvider).isNotEmpty)
                ...ref
                    .watch(mapOverlayStateProvider)
                    .values
                    .map((notification) =>
                        OverlayNotificationWidget(notification: notification))
                    .toList(),
              if (ref.watch(mapViewProvider) == MapBrowserView.routeView)
                const StopMarkerToggle(),
            ],
          ),
        ),
      ),
    );
  }
}

class OverlayNotificationWidget extends StatelessWidget {
  final String notification;
  const OverlayNotificationWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: ColoredBox(
        color: const Color.fromARGB(229, 240, 236, 92),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      notification,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 67, 59, 59)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
