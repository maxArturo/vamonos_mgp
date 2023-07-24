import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/adapters/cache/cache_provider.dart';
import 'package:vamonos_mgp/src/adapters/http/config.dart' as http_config;
import 'package:vamonos_mgp/src/util/config_provider.dart';

import 'http.dart';

part 'http_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) => Dio();

@Riverpod(keepAlive: true)
Map<String, String> defaultHeaders(DefaultHeadersRef ref) {
  final config = ref.watch(configProvider);
  final apiToken = config.apiToken;
  final buildId = config.buildId;

  return {
    ...http_config.defaultHeaders,
    if (apiToken != null) 'X-Auth-Token': apiToken,
    'X-Build-Id': buildId
  };
}

@Riverpod(keepAlive: true)
HttpAdapter httpAdapter(HttpAdapterRef ref) {
  final config = ref.watch(configProvider);
  return HttpAdapter(
    dio: ref.watch(dioProvider),
    requestCacheInterceptor: ref.watch(requestCacheInterceptorProvider),
    responseCacheInterceptor: ref.watch(responseCacheInterceptorProvider),
    defaultHeaders: ref.watch(defaultHeadersProvider),
    cacheDisabled: config.cacheDisabled,
  );
}

@Riverpod(keepAlive: true)
RequestCacheInterceptor requestCacheInterceptor(
    RequestCacheInterceptorRef ref) {
  final config = ref.watch(configProvider);
  return RequestCacheInterceptor(
    cacheAdapter: ref.watch(cacheAdapterProvider),
    failureEnabled: config.httpAddNetworkFailure,
    delayMs: config.httpCacheAddDelayMs,
  );
}

// failureEnabled: config.httpAddNetworkFailure,
@Riverpod(keepAlive: true)
ResponseCacheInterceptor responseCacheInterceptor(
        ResponseCacheInterceptorRef ref) =>
    ResponseCacheInterceptor(ref.watch(cacheAdapterProvider));
