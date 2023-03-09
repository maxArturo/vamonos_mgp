import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'route_stop_locations_model.freezed.dart';
part 'route_stop_locations_model.g.dart';

String _toString(dynamic value) => value.toString();

@freezed
class RouteStopLocations with _$RouteStopLocations {
  static String _toString(dynamic value) => value.toString();
  const factory RouteStopLocations(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString)
          required String statusCode,
      @JsonKey(name: 'MensajeEstado')
          required String statusMessage,
      @JsonKey(name: 'puntos')
          required List<RouteGeoData> routes}) = _RouteStopLocations;

  factory RouteStopLocations.fromJson(Map<String, Object?> json) =>
      _$RouteStopLocationsFromJson(json);
}

@freezed
class RouteGeoData with _$RouteGeoData {
  const factory RouteGeoData(
      {@JsonKey(name: 'AbreviaturaBanderaSMP', fromJson: _toString)
          required String routeDirection,
      @JsonKey(name: 'AbreviaturaLineaSMP', fromJson: _toString)
          required String lineAbbreviation,
      @JsonKey(name: 'IsPuntoPaso')
          required bool isCrossingPoint,
      @JsonKey(name: 'Descripcion', fromJson: _toString)
          required String description,
      @JsonKey(name: 'Latitud')
          num? latitude,
      @JsonKey(name: 'Longitud')
          num? longitude}) = _RouteGeoData;

  factory RouteGeoData.fromJson(Map<String, Object?> json) =>
      _$RouteGeoDataFromJson(json);
}
