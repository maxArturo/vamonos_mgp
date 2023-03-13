import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scroll_controller_provider.g.dart';

@riverpod
class PanelScrollController extends _$PanelScrollController {
  @override
  ScrollController build() {
    return ScrollController();
  }

  setScrollController(ScrollController sc) => state = sc;
}
