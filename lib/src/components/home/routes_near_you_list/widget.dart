import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/view.dart';

class RoutesNearYouList extends StatefulWidget {
  final ScrollController scrollController;
  const RoutesNearYouList(this.scrollController, {super.key});

  @override
  State<RoutesNearYouList> createState() => RoutesNearYouListController();
}

class RoutesNearYouListController extends State<RoutesNearYouList> {
  @override
  Widget build(BuildContext context) => RoutesNearYouListView(this);
}
