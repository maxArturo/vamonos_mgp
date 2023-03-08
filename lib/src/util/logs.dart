import 'package:flutter/foundation.dart';

configureApp() {
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
}
