import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scroll_controller_provider.g.dart';

@Riverpod(keepAlive: true)
class PanelScrollController extends _$PanelScrollController {
  @override
  Option<ScrollController> build() {
    return const None();
  }

  setScrollController(ScrollController sc) {
    state = Some(sc);
  }
}
