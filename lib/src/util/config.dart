import 'package:flutter/foundation.dart';

class ConfigOptions {
  final bool isReleaseMode;
  final int _httpCacheAddDelayMs;
  final bool _httpAddNetworkFailure;
  final bool _clearCacheOnHeaderTap;
  final bool _cacheDisabled;
  ConfigOptions(
      {int? httpCacheAddDelayMs = 0,
      bool? httpAddNetworkFailure = false,
      bool? clearCacheOnHeaderTap = false,
      cacheDisabled = false})
      : isReleaseMode = kReleaseMode,
        _clearCacheOnHeaderTap = clearCacheOnHeaderTap ?? false,
        _httpAddNetworkFailure = httpAddNetworkFailure ?? false,
        _httpCacheAddDelayMs = httpCacheAddDelayMs ?? 0,
        _cacheDisabled = cacheDisabled {
    if (isReleaseMode) {
      debugPrint = (String? message, {int? wrapWidth}) {};
    }
  }

  int? get httpCacheAddDelayMs => isReleaseMode
      ? null
      : _httpCacheAddDelayMs == 0
          ? null
          : _httpCacheAddDelayMs;
  bool get httpAddNetworkFailure =>
      isReleaseMode ? false : _httpAddNetworkFailure;
  get clearCacheOnHeaderTap => isReleaseMode ? null : _clearCacheOnHeaderTap;
  get cacheDisabled => isReleaseMode ? null : _cacheDisabled;
}
