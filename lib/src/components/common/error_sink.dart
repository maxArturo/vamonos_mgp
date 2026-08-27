import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

Widget errorSink(AppError err, {widget = const SizedBox.shrink()}) {
  debugPrint("error occurred: ${err.description}");
  debugPrint("error stack: ${err.stackTrace.toString()}");
  return widget;
}
