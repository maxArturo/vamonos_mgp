import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/transportation_routes_list/directed_routes_page/card/view.dart';
import 'package:vamonos_mgp/src/entities/route.dart';

class DirectedRouteCard extends ConsumerStatefulWidget {
  final DirectedRoute directedRoute;

  const DirectedRouteCard({required this.directedRoute, super.key});

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
