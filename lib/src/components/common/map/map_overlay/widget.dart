import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamonos_mgp/src/components/common/map/map_overlay/view.dart';
import 'package:vamonos_mgp/src/entities/coordinate.dart';
import 'package:vamonos_mgp/src/entities/map_browser_view.dart';

class MapOverlay extends StatefulWidget {
  final MapBrowserView view = MapBrowserView.stopView;
  final Coordinate? initialLocation;

  const MapOverlay({super.key, this.initialLocation});

  @override
  State<MapOverlay> createState() => MapOverlayController();
}

class MapOverlayController extends State<MapOverlay> {
  final MapController mc = MapController();

  @override
  Widget build(BuildContext context) {
    return MapOverlayView(this);
  }
}
