import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_map/plugin_api.dart';

class CachedTileAdapter extends TileProvider {
  final Map<String, String> _defaultHeaders;
  final CacheManager _cacheManager;

  CachedTileAdapter(
      {required CacheManager cacheManager,
      required Map<String, String> defaultHeaders})
      : _cacheManager = cacheManager,
        _defaultHeaders = defaultHeaders;

  @override
  ImageProvider<Object> getImage(Coords<num> coords, TileLayer options) {
    return CachedNetworkImageProvider(
        cacheManager: _cacheManager,
        headers: _defaultHeaders,
        getTileUrl(coords, options));
  }
}
