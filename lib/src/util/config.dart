import 'package:flutter/foundation.dart';

class ConfigOptions {
  final bool _isReleaseMode;
  final int _httpCacheAddDelayMs;
  final bool _httpAddNetworkFailure;
  final bool _clearCacheOnHeaderTap;
  final bool _cacheDisabled;
  ConfigOptions(
      {int? httpCacheAddDelayMs = 0,
      bool? httpAddNetworkFailure = false,
      bool? clearCacheOnHeaderTap = false,
      cacheDisabled = false})
      : _isReleaseMode = kReleaseMode,
        _clearCacheOnHeaderTap = clearCacheOnHeaderTap ?? false,
        _httpAddNetworkFailure = httpAddNetworkFailure ?? false,
        _httpCacheAddDelayMs = httpCacheAddDelayMs ?? 0,
        _cacheDisabled = cacheDisabled {
    if (_isReleaseMode) {
      debugPrint = (String? message, {int? wrapWidth}) {};
    }
  }

  int? get httpCacheAddDelayMs => _isReleaseMode
      ? null
      : _httpCacheAddDelayMs == 0
          ? null
          : _httpCacheAddDelayMs;
  bool get httpAddNetworkFailure =>
      _isReleaseMode ? false : _httpAddNetworkFailure;
  bool get clearCacheOnHeaderTap =>
      _isReleaseMode ? false : _clearCacheOnHeaderTap;
  bool get cacheDisabled => _isReleaseMode ? false : _cacheDisabled;
}
