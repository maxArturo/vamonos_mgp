import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'base_provider.g.dart';

@Riverpod(keepAlive: true)
CacheManager baseCacheManager(BaseCacheManagerRef ref) => CacheManager(
    Config('vamonos_mgp_cache', stalePeriod: const Duration(hours: 1)));
