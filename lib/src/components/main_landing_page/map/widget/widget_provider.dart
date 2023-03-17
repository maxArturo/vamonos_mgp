import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'widget_provider.g.dart';

@riverpod
PopupController popupController(PopupControllerRef ref) => PopupController();

@riverpod
PopupState popupState(PopupStateRef ref) => PopupState();
