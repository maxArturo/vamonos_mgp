import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scroll_controller_provider.g.dart';

@Riverpod(keepAlive: true)
class PanelScrollController extends _$PanelScrollController {
  @override
  Option<ScrollController> build() {
    debugPrint("[Provider] init: PanelScrollController");
    return const None();
  }

  setScrollController(ScrollController sc) {
    debugPrint("[Provider] setting sc: PanelScrollController");
    state = Some(sc);
  }
}
