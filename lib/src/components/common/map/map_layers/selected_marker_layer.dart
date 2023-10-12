import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';

class SelectedMarkerLayer extends StatelessWidget {
  final StopMarker marker;

  const SelectedMarkerLayer({super.key, required this.marker});

  @override
  Widget build(
    BuildContext context,
  ) {
    return MarkerLayer(
      markers: [
        marker.copyWith(
            size: 45.0, color: const Color.fromARGB(255, 19, 188, 0)),
      ],
    );
  }
}
