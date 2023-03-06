import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/adapters/cache/base_provider.dart';
import 'package:vamonos_mgp/src/adapters/http/http_provider.dart';
import 'package:vamonos_mgp/src/adapters/map_tile/map_tile.dart';

part 'map_tile_provider.g.dart';

@riverpod
CachedTileAdapter cachedTileAdapter(CachedTileAdapterRef ref) {
  return CachedTileAdapter(
      defaultHeaders: ref.watch(defaultHeadersProvider),
      cacheManager: ref.watch(baseCacheManagerProvider));
}
