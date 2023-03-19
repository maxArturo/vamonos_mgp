import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/adapters/map_tile/map_tile_provider.dart';

tileLayer() {
  return Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) => TileLayer(
      tileProvider: ref.watch(cachedTileAdapterProvider),
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.ar.vamonosmpg.app',
    ),
  );
}
