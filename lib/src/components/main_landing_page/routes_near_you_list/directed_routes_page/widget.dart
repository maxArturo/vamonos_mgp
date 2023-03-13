import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/directed_routes_page/view.dart';

class DirectedRoutesPage extends ConsumerStatefulWidget {
  final List<List<StopMarker>> directedRouteStops;

  const DirectedRoutesPage({required this.directedRouteStops, super.key});

  @override
  ConsumerState<DirectedRoutesPage> createState() =>
      DirectedRoutesPageController();
}

class DirectedRoutesPageController extends ConsumerState<DirectedRoutesPage> {
  @override
  Widget build(BuildContext context) {
    return DirectedRoutesPageView(this);
  }
}
