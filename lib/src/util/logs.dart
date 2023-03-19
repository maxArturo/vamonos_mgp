import 'package:flutter/foundation.dart';

configureLogs() {
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
}
