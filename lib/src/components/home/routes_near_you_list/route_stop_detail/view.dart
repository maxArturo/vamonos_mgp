import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/home/routes_near_you_list/route_stop_detail/widget.dart';
import 'package:vamonos_mgp/src/services/map/map_event_provider.dart';

class RouteStopDetailView
    extends ConsumerWidgetView<RouteStopDetail, RouteStopDetailController> {
  const RouteStopDetailView(super.state, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(stopMapOnEndEventStreamProvider, ((previous, next) async {
      next.whenData((value) {
        if (previous != null) {
          previous.whenData((prev) {
            if (prev.center != value.center) {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            }
          });
        }
      });
    }));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(widget.marker.point.latitude.toString(),
              style: const TextStyle(color: Colors.white)),
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(builder: (context) {
        return const Placeholder();
      }),
    );
  }
}
