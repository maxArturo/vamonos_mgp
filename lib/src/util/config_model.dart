import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'config_model.freezed.dart';

@freezed
class ConfigOptions with _$ConfigOptions {
  const factory ConfigOptions({
    @Default(kReleaseMode) bool isReleaseMode,
    @Default(null) int? httpCacheAddDelayMs,
    @Default(false) bool clearCacheOnHeaderTap,
    @Default(false) bool cacheDisabled,
    @Default(false) bool httpAddNetworkFailure,
    @Default('http://localhost:8080/map_tiles/osm') String osmApiUrl,
    @Default('http://localhost:8080/providers/mgp/app_cuando_llega/webWS.php')
    String mgpApiUrl,
    required String buildId,
    String? apiToken,
  }) = _ConfigOptions;

  const ConfigOptions._();
}
