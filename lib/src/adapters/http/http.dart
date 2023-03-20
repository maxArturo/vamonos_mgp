import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vamonos_mgp/src/adapters/cache/cache.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

typedef HttpAdapterResponse<T> = Future<Either<AppError, T>>;

String? cacheDisabled = dotenv.env['CACHE_DISABLED'];
int? debugDelayEnabled =
    int.tryParse(dotenv.env['DEBUG_ADD_HTTP_CACHE_DELAY_MS'] ?? "");

class HttpAdapter {
  final Dio _dio;
  final RequestCacheInterceptor _requestCacheInterceptor;
  final ResponseCacheInterceptor _responseCacheInterceptor;
  final Map<String, String> _defaultHeaders;

  HttpAdapter(this._dio, this._requestCacheInterceptor,
      this._responseCacheInterceptor, this._defaultHeaders) {
    cacheDisabled ?? _dio.interceptors.add(_requestCacheInterceptor);

    _dio.interceptors.addAll([
      PrettyDioLogger(requestBody: true),
      RetryInterceptor(
        dio: _dio,
        logPrint: debugPrint,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3),
        ],
      ),
    ]);
    _dio.interceptors.removeImplyContentTypeInterceptor();

    cacheDisabled ?? _dio.interceptors.add(_responseCacheInterceptor);
  }

  HttpAdapterResponse<dynamic> post({
    required String url,
    required String body,
    Map<String, dynamic>? extraHeaders,
    Duration? maxDuration,
  }) async {
    final requestOptions = Options(headers: {
      ..._defaultHeaders,
      ...extraHeaders ?? {},
    }, extra: {
      if (maxDuration != null) ...{
        ResponseCacheInterceptor.cacheMaxAgeSecondsKey: maxDuration.inSeconds
      }
    });

    final Response<dynamic> response =
        await _dio.post(url, data: body, options: requestOptions);

    if (defaultRetryableStatuses.contains(response.statusCode)) {
      return Left(HttpError());
    }
    return Right(response.data);
  }
}

class RequestCacheInterceptor extends QueuedInterceptorsWrapper {
  final CacheAdapter _cacheAdapter;
  RequestCacheInterceptor(this._cacheAdapter);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final key = "${options.uri}_${options.data}";
    final cacheResponse = (await _cacheAdapter.getFile(key));

    if (debugDelayEnabled != null) {
      debugPrint(
          "[$runtimeType] debug delay enabled for $debugDelayEnabled seconds");
      await Future.delayed(Duration(milliseconds: debugDelayEnabled!));
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
