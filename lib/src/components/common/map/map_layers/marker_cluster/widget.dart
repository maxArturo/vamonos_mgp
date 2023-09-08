import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/stop_marker_popup/stop_marker_popup.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';

class MarkerClusterWidget extends StatelessWidget {
  final List<StopMarker> markers;
  final PopupController popupController;
  final int maxClusterRadius;

  const MarkerClusterWidget(
      {super.key,
      required this.markers,
      required this.popupController,
      this.maxClusterRadius = 40});

  @override
  Widget build(BuildContext context) {
    return MarkerClusterLayerWidget(
      options: MarkerClusterLayerOptions(
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
        popupOptions: PopupOptions(
            buildPopupOnHover: false,
            popupAnimation: const PopupAnimation.fade(),
            popupSnap: PopupSnap.markerTop,
            popupController: popupController,
            popupBuilder: (_, marker) {
              final stopMarker = marker as StopMarker;
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: min(MediaQuery.of(context).size.width * .5, 500),
                child: GestureDetector(
                  child: StopMarkerPopup(
                    marker: stopMarker,
                  ),
                ),
              );
            }),
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
