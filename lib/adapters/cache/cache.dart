import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CacheAdapter {
  final CacheManager _cacheManager;

  CacheAdapter()
      : _cacheManager = CacheManager(
            Config('vamonos_mgp_cache', stalePeriod: const Duration(hours: 1)));

  Future<Option<File>> getFile(String key) async {
    final response = await _cacheManager.getFileFromCache(key);
    return Option.when(response != null, response!.file);
  }

  Future<File> putFile(String key, Uint8List bytes,
      {Duration? maxAge = const Duration(hours: 1)}) async {
    return await _cacheManager.putFile(key, bytes, maxAge: maxAge!);
  }
}
