import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'routes_by_arrival_model.freezed.dart';
part 'routes_by_arrival_model.g.dart';

String _toString(dynamic value) => value.toString();

@freezed
class RoutesByArrival with _$RoutesByArrival {
  static String _toString(dynamic value) => value.toString();
  const factory RoutesByArrival(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString)
          required String statusCode,
      @JsonKey(name: 'MensajeEstado')
          required String statusMessage,
      @JsonKey(name: 'lineas')
          required List<Route> routes}) = _RoutesByArrival;

  factory RoutesByArrival.fromJson(Map<String, Object?> json) =>
      _$RoutesByArrivalFromJson(json);
}

@freezed
class Route with _$Route {
  const factory Route({
    @JsonKey(name: 'CodigoLineaParada', fromJson: _toString)
        required String code,
    @JsonKey(name: 'Descripcion', fromJson: _toString)
        required String description,
    @JsonKey(name: 'CodigoEntidad', fromJson: _toString)
        required String entityCode,
    @JsonKey(name: 'CodigoEmpresa', fromJson: _toString)
        required String companyCode,
  }) = _Route;

  factory Route.fromJson(Map<String, Object?> json) => _$RouteFromJson(json);
}
