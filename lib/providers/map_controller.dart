import 'package:flutter_map/flutter_map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_controller.g.dart';

@riverpod
class MapControllerStore extends _$MapControllerStore {
  @override
  FutureOr<MapController?> build() {
    return null;
  }

  initialize() {
    state = AsyncValue.data(MapController());
  }
}
