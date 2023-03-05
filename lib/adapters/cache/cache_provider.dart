import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/adapters/cache/cache.dart';

part 'cache_provider.g.dart';

@riverpod
CacheAdapter cacheAdapter(CacheAdapterRef ref) {
  return CacheAdapter();
}
