import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamonos_mgp/src/components/common/map/map_layers/error_layer.dart';
import 'package:vamonos_mgp/src/services/location/location_provider.dart';
import 'package:vamonos_mgp/src/util/extensions/riverpod.dart';

class CurrentLocationLayer extends ConsumerWidget {
  const CurrentLocationLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(updatedLocationServiceProvider).fold(
          data: (r) => MarkerLayer(
            markers: [
              Marker(
                  rotate: true,
                  point: LatLng(r.latitude!, r.longitude!),
                  anchorPos: AnchorPos.align(AnchorAlign.center),
                  height: 40,
                  width: 40,
                  builder: (context) => const Icon(
                        Icons.location_on_sharp,
                        color: Colors.red,
                        size: 40,
                      )),
            ],
          ),
          error: (l) => ErrorLayer(error: l),
          loading: () => const SizedBox.shrink(), // empty widget
        );
  }
}
