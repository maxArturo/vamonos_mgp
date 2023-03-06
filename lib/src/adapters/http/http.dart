import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

import '../cache/cache.dart';

typedef HttpAdapterResponse<T> = Future<Either<HttpError, T>>;

String? cacheDisabled = dotenv.env['CACHE_DISABLED'];

class HttpAdapter {
  final Dio _dio;
  final RequestCacheInterceptor _requestCacheInterceptor;
  final ResponseCacheInterceptor _responseCacheInterceptor;

  HttpAdapter(this._dio, this._requestCacheInterceptor,
      this._responseCacheInterceptor) {
    cacheDisabled ?? _dio.interceptors.add(_requestCacheInterceptor);

    _dio.interceptors.addAll([
      RetryInterceptor(
        dio: _dio,
        logPrint: print, // specify log function (optional)
        retries: 3, // retry count (optional)
        retryDelays: const [
          // set delays between retries (optional)
          Duration(seconds: 1), // wait 1 sec before first retry
          Duration(seconds: 2), // wait 2 sec before second retry
          Duration(seconds: 3), // wait 3 sec before third retry
        ],
      ),
      PrettyDioLogger(),
    ]);
    _dio.interceptors.removeImplyContentTypeInterceptor();

    cacheDisabled ?? _dio.interceptors.add(_responseCacheInterceptor);
  }

  final defaultHeaders = {
    'User-Agent': 'com.vamonos-mgp.app',
    "Accept-Encoding": "gzip, deflate",
    "Accept-Language": "en-US,en;q=0.5",
  };

  HttpAdapterResponse<dynamic> post({
    required String url,
    required String body,
    Map<String, dynamic>? extraHeaders,
    Duration? maxDuration,
  }) async {
    final requestOptions = Options(
        headers: {
          ...defaultHeaders,
          ...extraHeaders ?? {},
        },
        extra: maxDuration != null
            ? {
                ResponseCacheInterceptor.cacheMaxAgeSecondsKey:
                    maxDuration.inSeconds
              }
            : {});

    final Response<dynamic> response =
        await _dio.post(url, data: body, options: requestOptions);

    if (response.statusCode != 200) {
      return Left(HttpError());
    }
    return Right(response.data);
  }
}

class RequestCacheInterceptor extends InterceptorsWrapper {
  final CacheAdapter _cacheAdapter;
  RequestCacheInterceptor(this._cacheAdapter);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final key = options.uri.toString() + options.data.toString();
    final cacheResponse = (await _cacheAdapter.getFile(key));
    return cacheResponse.fold(() => super.onRequest(options, handler),
        (file) async {
      return handler.resolve(Response(
        requestOptions: options,
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
        response.realUri.toString() + response.requestOptions.data.toString(),
        responseData,
        maxAge: cacheDuration ? Duration(seconds: cacheDuration) : null);

    super.onResponse(response, handler);
  }
}
