// generates a single SizedBox representing a transportation line
// in the expanding drawer.
import 'package:flutter/material.dart';
import 'package:vamonos_mgp/components/common/widget_view.dart';
import 'package:vamonos_mgp/components/main_landing_page/routes_near_you_list/widget.dart';

class RoutesNearYouListView
    extends WidgetView<RoutesNearYouList, RoutesNearYouListController> {
  const RoutesNearYouListView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          controller: widget.scrollController,
          itemCount: state.routes.length + 1,
          itemBuilder: (context, idx) {
            if (state.routes.isEmpty) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.block_sharp,
                        size: 30,
                        color: Color.fromARGB(255, 194, 63, 63),
                      ),
                      Text("No routes near you".toUpperCase(),
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(width: 13),
                ],
              );
            }
            if (idx == 0) {
              return Column(children: [
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 30,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12.0))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("routes near you".toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                )
              ]);
            } else {
              return _lineGenerator(
                  state.routes[idx - 1].name, state.routes[idx - 1].id);
            }
          }),
    );
  }
}

SizedBox _lineGenerator(String lineName, int dueIn) {
  final colors = [
    Colors.lightBlue,
    const Color.fromARGB(255, 24, 84, 26),
    Colors.deepOrangeAccent,
    Colors.deepPurpleAccent
  ];

  final color = colors[dueIn % colors.length];

  return SizedBox(
    width: double.infinity,
    child: MaterialButton(
      onPressed: () {},
      color: color,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Sample Line $lineName".toUpperCase(),
                      style: const TextStyle(color: Colors.white)),
                  Text("Due in $dueIn min".toUpperCase(),
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(width: 13),
              const Icon(Icons.bus_alert_outlined, color: Colors.white),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}
