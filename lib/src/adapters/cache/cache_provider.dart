import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/adapters/cache/base_provider.dart';
import 'package:vamonos_mgp/src/adapters/cache/cache.dart';

part 'cache_provider.g.dart';

@Riverpod(keepAlive: true)
CacheAdapter cacheAdapter(CacheAdapterRef ref) {
  return CacheAdapter(ref.watch(baseCacheManagerProvider));
}
