import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/util/config_model.dart';

part 'config_provider.g.dart';

@Riverpod(keepAlive: true)
class Config extends _$Config {
  @override
  ConfigOptions build() {
    return ConfigOptions(
      httpCacheAddDelayMs:
          int.tryParse(dotenv.env['DEBUG_HTTP_ADD_CACHE_DELAY_MS'] ?? ""),
      cacheDisabled: toBool(dotenv.env['DEBUG_CACHE_DISABLED']),
      clearCacheOnHeaderTap: toBool(
        dotenv.env['DEBUG_CLEAR_CACHE_ON_TAP'],
      ),
      httpAddNetworkFailure:
          toBool(dotenv.env['DEBUG_HTTP_ADD_NETWORK_FAILURE']),
      osmApiUrl:
          dotenv.env['OSM_API_URL'] ?? 'http://localhost:8080/map_tiles/osm',
      mgpApiUrl: dotenv.env['MGP_ROUTE_API_URL'] ??
          'http://localhost:8080/providers/mgp/app_cuando_llega/webWS.php',
      apiToken: dotenv.env['API_TOKEN'],
    );
  }

  bool toBool(dynamic val) {
    if (val is String) {
      return val.toLowerCase() == 'true';
    }
    if (val is bool) {
      return val;
    }
    return false;
  }
}
