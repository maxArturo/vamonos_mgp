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
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          clipBehavior: Clip.hardEdge,
          child: Column(children: [
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            RoutesNearYouList(widget.sc)
          ])),
    );
  }
}
