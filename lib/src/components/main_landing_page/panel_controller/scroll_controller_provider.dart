import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scroll_controller_provider.g.dart';

@Riverpod(keepAlive: true)
class PanelScrollController extends _$PanelScrollController {
  @override
  ScrollController build() {
    debugPrint("[Provider] init: PanelScrollController");
    return ScrollController();
  }

  setScrollController(ScrollController sc) {
    debugPrint("[Provider] setting sc: PanelScrollController");
    state = sc;
  }
}
