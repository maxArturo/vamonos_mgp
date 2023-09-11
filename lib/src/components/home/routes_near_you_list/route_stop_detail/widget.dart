import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/marker.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/route_stop_detail/view.dart';

class RouteStopDetail extends StatefulWidget {
  final StopMarker marker;
  const RouteStopDetail({super.key, required this.marker});

  @override
  State<RouteStopDetail> createState() => RouteStopDetailController();
}

class RouteStopDetailController extends State<RouteStopDetail> {
  @override
  Widget build(BuildContext context) {
    return RouteStopDetailView(this);
  }
}
