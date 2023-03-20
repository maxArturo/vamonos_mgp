import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scroll_controller_provider.g.dart';

@Riverpod(keepAlive: true)
class PanelScrollController extends _$PanelScrollController {
  final _scCompleter = Completer<ScrollController>();

  @override
  FutureOr<ScrollController> build() {
    return _scCompleter.future;
  }

  initialize(ScrollController sc) {
    if (!_scCompleter.isCompleted) {
      _scCompleter.complete(sc);
    }
  }
}
