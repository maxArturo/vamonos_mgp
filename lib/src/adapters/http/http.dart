import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vamonos_mgp/src/adapters/cache/cache.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

typedef HttpAdapterResponse<T> = Future<Either<AppError, T>>;

class HttpAdapter {
  final Dio dio;
  final RequestCacheInterceptor requestCacheInterceptor;
  final ResponseCacheInterceptor responseCacheInterceptor;
  final Map<String, String> defaultHeaders;
  final bool cacheDisabled;

  HttpAdapter({
    required this.dio,
    required this.requestCacheInterceptor,
    required this.responseCacheInterceptor,
    required this.defaultHeaders,
    required this.cacheDisabled,
  }) {
    dio.interceptors.addAll([
      if (!cacheDisabled) requestCacheInterceptor,
      PrettyDioLogger(requestBody: true, responseBody: false),
      RetryInterceptor(
        dio: dio,
        logPrint: debugPrint,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3),
        ],
      ),
      if (!cacheDisabled) responseCacheInterceptor,
    ]);
    dio.interceptors.removeImplyContentTypeInterceptor();
  }

  HttpAdapterResponse<dynamic> post({
    required String url,
    required String body,
    Map<String, dynamic>? extraHeaders,

    /// defines max duration in the internal response cache.
    Duration? maxDuration,
  }) async {
    try {
      final requestOptions = Options(headers: {
        ...defaultHeaders,
        if (extraHeaders != null) ...extraHeaders,
      }, extra: {
        if (maxDuration != null) ...{
          ResponseCacheInterceptor.cacheMaxAgeSecondsKey: maxDuration.inSeconds
        }
      });

      final Response<dynamic> response =
          await dio.post(url, data: body, options: requestOptions);

      if (defaultRetryableStatuses.contains(response.statusCode)) {
        throw HttpError();
      }

      return Right(response.data);
    } catch (e) {
      return Left(HttpError(description: e.toString()));
    }
  }
}

class RequestCacheInterceptor extends QueuedInterceptorsWrapper {
  final CacheAdapter cacheAdapter;
  final bool failureEnabled;
  final int? delayMs;
  RequestCacheInterceptor(
      {required this.cacheAdapter, this.failureEnabled = false, this.delayMs});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final key = "${options.uri}_${options.data}";
    final cacheResponse = (await cacheAdapter.getFile(key));

    if (failureEnabled) {
      if (Random().nextBool()) {
        debugPrint("[$runtimeType] debug failure enabled, failing with 500...");
        return handler.resolve(Response(
          requestOptions: options,
          statusCode: 500,
        ));
      }
    }

    if (delayMs != null) {
      debugPrint("[$runtimeType] debug delay enabled for $delayMs seconds");
      await Future.delayed(Duration(milliseconds: delayMs!));
    }

    return cacheResponse.fold(() {
      debugPrint("cache missed for $key");
      return super.onRequest(options, handler);
    }, (file) async {
      debugPrint("cache found for $file");
      return handler.resolve(Response(
        requestOptions: options,
        statusCode: 304,
        data: (await file.readAsString()),
      ));
    });
  }
}

class ResponseCacheInterceptor extends InterceptorsWrapper {
  final CacheAdapter _cacheAdapter;
  static const cacheMaxAgeSecondsKey = '@cache_max_age_seconds@';

  ResponseCacheInterceptor(this._cacheAdapter);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final cacheDuration = response.requestOptions.extra[cacheMaxAgeSecondsKey];

    final responseData = Uint8List.fromList(response.data.toString().codeUnits);

    _cacheAdapter.putFile(
        "${response.realUri}_${response.requestOptions.data}", responseData,
        maxAge:
            (cacheDuration != null) ? Duration(seconds: cacheDuration) : null);

    super.onResponse(response, handler);
  }
}
