import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/routes_provider.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/view.dart';

class RoutesNearYouList extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  const RoutesNearYouList(this.scrollController, {super.key});

  @override
  ConsumerState<RoutesNearYouList> createState() =>
      RoutesNearYouListController();
}

class RoutesNearYouListController extends ConsumerState<RoutesNearYouList> {
  final animatedListKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(routesNearYouProvider);
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: provider.maybeWhen(
            data: (data) => RoutesNearYouListView(
                  widget.scrollController,
                  routeData: data,
                  key: const Key('dataLoaded'),
                ),
            loading: () => const Center(
                  key: Key('loading'),
                  child: CircularProgressIndicator(),
                ),
            orElse: () => const Text(
                  "An unexpected error occurred",
                  key: Key('error'),
                  style: TextStyle(color: Colors.red),
                )));
  }
}
