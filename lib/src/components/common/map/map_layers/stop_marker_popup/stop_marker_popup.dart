import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/stop_marker_popup/popup_row.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';

class StopMarkerPopup extends ConsumerWidget {
  final StopMarker marker;
  const StopMarkerPopup({required this.marker, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
            marker.routeStops.map((stop) => StopPopupRow(stop: stop)).toList());
  }
}
