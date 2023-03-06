import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/routes_near_you_list/view.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';

class RoutesNearYouList extends StatefulWidget {
  final ScrollController scrollController;
  const RoutesNearYouList(this.scrollController, {super.key});

  @override
  State<RoutesNearYouList> createState() => RoutesNearYouListController();
}

class RoutesNearYouListController extends State<RoutesNearYouList> {
  List<RouteStop> routes = [];

  @override
  Widget build(BuildContext context) {
    return RoutesNearYouListView(this);
  }
}
