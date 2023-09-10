import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';

class MarkerClusterWidget extends ConsumerWidget {
  final List<StopMarker> markers;
  final PopupController popupController;
  final int maxClusterRadius;

  const MarkerClusterWidget(
      {super.key,
      required this.markers,
      required this.popupController,
      this.maxClusterRadius = 40});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MarkerClusterLayerWidget(
      options: MarkerClusterLayerOptions(
        onMarkerTap: (marker) {},
        animationsOptions: const AnimationsOptions(
            spiderfy: Duration(milliseconds: 500),
            zoom: Duration(milliseconds: 500)),
        maxClusterRadius: maxClusterRadius,
        size: const Size(40, 40),
        anchorPos: AnchorPos.align(AnchorAlign.center),
        fitBoundsOptions: const FitBoundsOptions(
          padding: EdgeInsets.all(50),
          maxZoom: 15,
        ),
        markers: markers,
        builder: (context, markers) {
          return const FaIcon(
            FontAwesomeIcons.mapPin,
            size: 35,
            color: Colors.black,
          );
        },
      ),
    );
  }
}
