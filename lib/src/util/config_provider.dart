import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/util/config.dart';

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
