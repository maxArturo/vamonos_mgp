import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:vamonos_mgp/util/errors.dart';

class HttpAdapter {
  static HttpAdapter? _instance;
  final Dio _dio = Dio();

  factory HttpAdapter() => _instance ??= HttpAdapter._internal();

  HttpAdapter._internal() {
    _instance = this;
    _dio.interceptors.add(RetryInterceptor(
      dio: _dio,
      logPrint: print, // specify log function (optional)
      retries: 3, // retry count (optional)
      retryDelays: const [
        // set delays between retries (optional)
        Duration(seconds: 1), // wait 1 sec before first retry
        Duration(seconds: 2), // wait 2 sec before second retry
        Duration(seconds: 3), // wait 3 sec before third retry
      ],
    ));
    _dio.interceptors.removeImplyContentTypeInterceptor();
  }

  Future<Either<HttpError, Map<String, dynamic>>> post(
      String url, String body, Map<String, dynamic>? extraHeaders) async {
    final response = await _dio.post(url,
        data: body,
        options: Options(
          headers: {
            'User-Agent': 'com.vamonos-mgp.app',
            "Accept": "application/json, text/javascript, */*; q=0.01",
            "Accept-Encoding": "gzip, deflate",
            "Accept-Language": "en-US,en;q=0.5",
            "Content-Type": Headers.formUrlEncodedContentType,
            ...extraHeaders ?? {},
          },
        ));

    if (response.statusCode != 200) {
      return Left(HttpError());
    }
    return Right(response.data);
  }
}
