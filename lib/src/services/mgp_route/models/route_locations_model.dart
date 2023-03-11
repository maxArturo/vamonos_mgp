import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'route_locations_model.freezed.dart';
part 'route_locations_model.g.dart';

String _toString(dynamic value) => value.toString();

@freezed
class RouteLocations with _$RouteLocations {
  static String _toString(dynamic value) => value.toString();
  const factory RouteLocations(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString)
          required String statusCode,
      @JsonKey(name: 'MensajeEstado')
          required String statusMessage,
      @JsonKey(name: 'puntos')
          required List<RouteGeoData> routes}) = _RouteLocations;

  factory RouteLocations.fromJson(Map<String, Object?> json) =>
      _$RouteLocationsFromJson(json);
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
