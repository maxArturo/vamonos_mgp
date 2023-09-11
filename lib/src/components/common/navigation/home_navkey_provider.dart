import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_navkey_provider.g.dart';

@Riverpod(keepAlive: true)
class HomeNavkey extends _$HomeNavkey {
  final _navkeyCompleter = Completer<GlobalKey<NavigatorState>>();

  @override
  FutureOr<GlobalKey<NavigatorState>> build() {
    return _navkeyCompleter.future;
  }

  initialize(GlobalKey<NavigatorState> key) {
    if (!_navkeyCompleter.isCompleted) {
      _navkeyCompleter.complete(key);
    } else {
      state = AsyncData(key);
    }
  }
}
