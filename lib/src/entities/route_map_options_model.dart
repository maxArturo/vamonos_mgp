import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_map_options_model.freezed.dart';

@freezed
class RouteMapState with _$RouteMapState {
  const factory RouteMapState({@Default(false) bool showAllStops}) =
      _RouteMapState;
}
