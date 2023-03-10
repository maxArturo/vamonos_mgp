import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/routes_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/view.dart';

class RoutesNearYouList extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  const RoutesNearYouList(this.scrollController, {super.key});

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   return ref.watch(routesNearYouProvider).maybeWhen(
  //       data: (data) =>
  //           RoutesNearYouListView(scrollController, routeData: data),
  //       loading: () => const Center(
  //             child: CircularProgressIndicator(),
  //           ),
  //       orElse: () => const Text(
  //             "An unexpected error occurred",
  //             style: TextStyle(color: Colors.red),
  //           ));
  // }

  @override
  ConsumerState<RoutesNearYouList> createState() =>
      RoutesNearYouListController();
}

class RoutesNearYouListController extends ConsumerState<RoutesNearYouList> {
  final animatedListKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return ref.watch(routesNearYouProvider).maybeWhen(
        data: (data) =>
            RoutesNearYouListView(widget.scrollController, routeData: data),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        orElse: () => const Text(
              "An unexpected error occurred",
              style: TextStyle(color: Colors.red),
            ));
  }
}
