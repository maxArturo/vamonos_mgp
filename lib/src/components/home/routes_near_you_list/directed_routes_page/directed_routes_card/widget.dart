import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/home/map/markers/markers.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/directed_routes_page/directed_routes_card/view.dart';

class DirectedRouteCard extends ConsumerStatefulWidget {
  final StopMarker stop;

  const DirectedRouteCard({required this.stop, super.key});

  @override
  ConsumerState<DirectedRouteCard> createState() =>
      DirectedRouteCardController();
}

class DirectedRouteCardController extends ConsumerState<DirectedRouteCard> {
  @override
  Widget build(BuildContext context) {
    return DirectedRouteCardView(this);
  }
}
