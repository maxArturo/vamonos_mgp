import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/transportation_routes_list/directed_routes_page/view.dart';
import 'package:vamonos_mgp/src/entities/route.dart' as entity;
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/route_landmark.dart';
import 'package:vamonos_mgp/src/services/mgp_route/route_landmarks/route_landmarks_provider.dart';
import 'package:vamonos_mgp/src/util/extensions/riverpod.dart';

class DirectedRoutesPage extends ConsumerStatefulWidget {
  const DirectedRoutesPage({super.key, required this.route});
  final entity.Route route;

  @override
  ConsumerState<DirectedRoutesPage> createState() =>
      DirectedRoutesPageController();
}

class DirectedRoutesPageController extends ConsumerState<DirectedRoutesPage> {
  toDirectedRoutes(List<RouteLandMark> landmarks) {
    return landmarks.fold(<DirectedRoute>{}, (previousValue, element) {
      previousValue.add(element.route);
      return previousValue;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(RouteLandMarksByIdProvider(route: widget.route)).fold(
        data: (r) => DirectedRoutesPageView(
              this,
              directedRoutes: toDirectedRoutes(r),
            ),
        error: (err) => Text(
              err.userText,
              key: const Key('error'),
              style: const TextStyle(color: Colors.red),
            ),
        loading: () => const Center(
              key: Key('loading'),
              child: CircularProgressIndicator(),
            ));
  }
}
