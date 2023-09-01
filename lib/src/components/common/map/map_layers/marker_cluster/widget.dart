import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/stop_marker_popup.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';

class MarkerClusterWidget extends StatelessWidget {
  final List<StopMarker> markers;
  final PopupState popupState;
  final PopupController popupController;
  final int maxClusterRadius;

  const MarkerClusterWidget(
      {super.key,
      required this.markers,
      required this.popupController,
      required this.popupState,
      this.maxClusterRadius = 5});

  @override
  Widget build(BuildContext context) {
    return MarkerClusterLayerWidget(
      options: MarkerClusterLayerOptions(
        animationsOptions: const AnimationsOptions(
            spiderfy: Duration(milliseconds: 500),
            zoom: Duration(milliseconds: 500)),
        maxClusterRadius: maxClusterRadius,
        size: const Size(20, 20),
        anchor: AnchorPos.align(AnchorAlign.center),
        fitBoundsOptions: const FitBoundsOptions(
          padding: EdgeInsets.all(5),
          maxZoom: 15,
        ),
        markers: markers,
        popupOptions: PopupOptions(
            popupAnimation: const PopupAnimation.fade(),
            popupState: popupState,
            popupSnap: PopupSnap.markerTop,
            popupController: popupController,
            popupBuilder: (_, marker) {
              final stopMarker = marker as StopMarker;
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: min(MediaQuery.of(context).size.width * .5, 300),
                height: 100,
                child: GestureDetector(
                  child: StopMarkerPopup(
                    stop: stopMarker,
                  ),
                ),
              );
            }),
        builder: (context, markers) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.blue),
            child: Center(
              child: Text(
                markers.length.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
