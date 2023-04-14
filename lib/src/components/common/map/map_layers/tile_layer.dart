import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/adapters/map_tile/map_tile_provider.dart';
import 'package:vamonos_mgp/src/util/config_provider.dart';

class TileLayerWidget extends ConsumerWidget {
  const TileLayerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TileLayer(
      tileProvider: ref.watch(cachedTileAdapterProvider),
      urlTemplate: "${ref.watch(configProvider).osmApiUrl}/{z}/{x}/{y}.png",
      userAgentPackageName: 'com.ar.vamonosmpg.app',
    );
  }
}
