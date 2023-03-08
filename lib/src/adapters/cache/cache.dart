import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CacheAdapter {
  final CacheManager _cacheManager;

  CacheAdapter(this._cacheManager);

  Future<Option<File>> getFile(String key) async {
    final response = await _cacheManager.getFileFromCache(key);
    final validTill = response?.validTill;

    debugPrint("cache file hit valid till $validTill");
    if (validTill != null && DateTime.now().compareTo(validTill) >= 0) {
      return none();
    }

    return optionOf(response).map((a) => a.file);
  }

  Future<File> putFile(String key, Uint8List bytes,
      {Duration? maxAge = const Duration(days: 1)}) async {
    return await _cacheManager.putFile(key, bytes, maxAge: maxAge!);
  }
}
