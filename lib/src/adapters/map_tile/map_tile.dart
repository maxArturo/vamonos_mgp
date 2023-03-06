import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';

class CachedTileAdapter extends TileProvider {
  final Map<String, String> _defaultHeaders;

  CachedTileAdapter(this._defaultHeaders);

  @override
  ImageProvider<Object> getImage(Coords<num> coords, TileLayer options) {
    return CachedNetworkImageProvider(
        headers: _defaultHeaders, getTileUrl(coords, options));
  }
}
