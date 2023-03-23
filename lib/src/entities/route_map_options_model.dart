import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_map_options_model.freezed.dart';

@freezed
class RouteMapState with _$RouteMapState {
  // TODO revert true to false
  const factory RouteMapState({@Default(true) bool showAllStops}) =
      _RouteMapState;
}
