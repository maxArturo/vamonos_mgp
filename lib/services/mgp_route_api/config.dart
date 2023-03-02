import 'package:dio/dio.dart';

final baseApiHeaders = {
  "Accept": "application/json, text/javascript, */*; q=0.01",
  "Accept-Encoding": "gzip, deflate",
  "Accept-Language": "en-US,en;q=0.5",
  "Content-Type": Headers.formUrlEncodedContentType,
  // for some reason the API looks for this specifically
  'Referer': 'https://appsl.mardelplata.gob.ar/app_cuando_llega/cuando.php',
};
