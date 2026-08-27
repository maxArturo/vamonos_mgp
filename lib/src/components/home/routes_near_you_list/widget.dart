import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/navigation/home_navkey_provider.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/view.dart';

class RoutesNearYouList extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  const RoutesNearYouList(this.scrollController, {super.key});

  @override
  ConsumerState<RoutesNearYouList> createState() =>
      RoutesNearYouListController();
}

class RoutesNearYouListController extends ConsumerState<RoutesNearYouList> {
  late GlobalKey<NavigatorState> navigatorKey;

  @override
  void initState() {
    super.initState();
    navigatorKey = GlobalKey<NavigatorState>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(homeNavkeyProvider.notifier).initialize(navigatorKey);
    });
  }

  @override
  Widget build(BuildContext context) => RoutesNearYouListView(this);
}
