import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/src/components/common/map/config.dart';
import 'package:vamonos_mgp/src/components/common/map/stop_view_map/view.dart';
import 'package:vamonos_mgp/src/components/common/toast.dart';
import 'package:vamonos_mgp/src/entities/map_browser_view.dart';
import 'package:vamonos_mgp/src/services/location/location_provider.dart';
import 'package:vamonos_mgp/src/util/extensions/riverpod.dart';

class StopMap extends ConsumerStatefulWidget {
  final MapBrowserView view = MapBrowserView.stopView;
  final LocationData? initialLocation;

  const StopMap({super.key, this.initialLocation});

  @override
  ConsumerState<StopMap> createState() => StopMapController();
}

class StopMapController extends ConsumerState<StopMap> {
  final MapController mc = MapController();

  @override
  Widget build(BuildContext context) {
    if (widget.initialLocation != null) {
      return StopMapView(this, initialLocation: widget.initialLocation!);
    }
    return ref.watch(locationServiceProvider).fold(
          data: (r) => StopMapView(key: UniqueKey(), this, initialLocation: r),
          error: (l) {
            errorToastSink(l);
            return StopMapView(
                key: UniqueKey(), this, initialLocation: defaultCenterLocation);
          },
          loading: () => StopMapView(
              key: UniqueKey(), this, initialLocation: defaultCenterLocation),
        );
  }
}
