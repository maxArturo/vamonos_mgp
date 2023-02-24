import 'package:flutter/material.dart';
import 'package:vamonos_mgp/components/main_landing_page/routes_list/view.dart';
import 'package:vamonos_mgp/entities/route_stop.dart';
import 'package:vamonos_mgp/adapters/transportation_api/routes.dart';

class RoutesNearYouList extends StatefulWidget {
  final ScrollController scrollController;
  const RoutesNearYouList(this.scrollController, {super.key});

  @override
  State<RoutesNearYouList> createState() => RoutesNearYouListController();
}

class RoutesNearYouListController extends State<RoutesNearYouList> {
  List<RouteStop> routes = [];

  @override
  void initState() {
    getRoutesNearYou(location: null).then((el) {
      setState(() {
        routes = el;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RoutesNearYouListView(this);
  }
}
