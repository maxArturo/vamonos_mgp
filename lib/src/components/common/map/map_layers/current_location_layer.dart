import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamonos_mgp/src/services/location/location_provider.dart';

class CurrentLocationLayer extends ConsumerWidget {
  const CurrentLocationLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(updatedLocationServiceProvider).maybeWhen(
        data: (loc) => MarkerLayer(
              markers: [
                Marker(
                    rotate: true,
                    point: LatLng(loc.latitude!, loc.longitude!),
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
        orElse: () => Align(
              alignment: const Alignment(0.0, -0.9),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: ColoredBox(
                  color: const Color.fromARGB(204, 203, 65, 65),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text(
                                "Current Location Not Available",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
