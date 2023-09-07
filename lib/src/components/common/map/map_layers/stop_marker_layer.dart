import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/marker_cluster/widget.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/markers_provider.dart';
import 'package:vamonos_mgp/src/components/common/map/popup/popup_provider.dart';
import 'package:vamonos_mgp/src/components/common/error_sink.dart';
import 'package:vamonos_mgp/src/util/extensions/riverpod.dart';

class StopMarkerLayer extends ConsumerWidget {
  const StopMarkerLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(markersWithinMapBoundsProvider).fold(
          skipLoadingOnReload: true,
          data: (markers) => MarkerClusterWidget(
              markers: markers,
              popupController: ref.watch(stopViewPopupControllerProvider)),
          error: errorSink,
          loading: () => const SizedBox.shrink(), // empty widget
        );
  }
}
