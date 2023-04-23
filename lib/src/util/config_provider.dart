import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/util/config_model.dart';

part 'config_provider.g.dart';

@Riverpod(keepAlive: true)
class Config extends _$Config {
  @override
  ConfigOptions build() {
    // super sad state of affairs but everything needs to be const

    const apiToken = String.fromEnvironment(
      'API_TOKEN',
    );
    const osmApiUrl = String.fromEnvironment('OSM_API_URL',
        defaultValue: 'http://localhost:8080/map_tiles/osm');

    const mpgApiUrl = String.fromEnvironment('MGP_ROUTE_API_URL',
        defaultValue:
            'http://localhost:8080/providers/mgp/app_cuando_llega/webWS.php');
    const debugAddCacheDelay =
        String.fromEnvironment('DEBUG_HTTP_ADD_CACHE_DELAY_MS');

    const debugCacheDisabled = String.fromEnvironment('DEBUG_CACHE_DISABLED');
    const debugClearCacheOnTap =
        String.fromEnvironment('DEBUG_CLEAR_CACHE_ON_TAP');
    const debugAddNetworkFailure =
        String.fromEnvironment('DEBUG_HTTP_ADD_NETWORK_FAILURE');

    return ConfigOptions(
      httpCacheAddDelayMs: int.tryParse(debugAddCacheDelay),
      cacheDisabled: toBool(debugCacheDisabled),
      clearCacheOnHeaderTap: toBool(debugClearCacheOnTap),
      httpAddNetworkFailure: toBool(debugAddNetworkFailure),
      osmApiUrl: osmApiUrl,
      mgpApiUrl: mpgApiUrl,
      apiToken: apiToken,
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
