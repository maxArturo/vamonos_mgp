import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/map/route_map/stop_marker_toggle/view.dart';

class StopMarkerToggle extends ConsumerStatefulWidget {
  const StopMarkerToggle({
    super.key,
  });

  @override
  ConsumerState<StopMarkerToggle> createState() => StopMarkerToggleController();
}

class StopMarkerToggleController extends ConsumerState<StopMarkerToggle> {
  final MaterialStateProperty<Icon> checkIcon =
      MaterialStateProperty.resolveWith<Icon>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return StopMarkerToggleView(
      this,
    );
  }
}
