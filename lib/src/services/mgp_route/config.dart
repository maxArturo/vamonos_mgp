import 'dart:io';

final baseApiHeaders = {
  HttpHeaders.acceptHeader: "application/json, text/javascript, */*; q=0.01",
  HttpHeaders.acceptEncodingHeader: "gzip, deflate",
  HttpHeaders.acceptLanguageHeader: "en-US,en;q=0.5",
  HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  // for some reason the API looks for this specifically
  HttpHeaders.refererHeader:
      'https://appsl.mardelplata.gob.ar/app_cuando_llega/cuando.php',
};
