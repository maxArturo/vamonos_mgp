import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/widget.dart';

class SlidingUpDrawer extends StatefulWidget {
  final ScrollController sc;

  const SlidingUpDrawer(
    this.sc, {
    super.key,
  });

  @override
  SlidingUpDrawerController createState() => SlidingUpDrawerController();
}

class SlidingUpDrawerController extends State<SlidingUpDrawer> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpDrawerView(this);
  }
}

class SlidingUpDrawerView
    extends WidgetView<SlidingUpDrawer, SlidingUpDrawerController> {
  const SlidingUpDrawerView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return RoutesNearYouList(widget.sc);
  }
}
