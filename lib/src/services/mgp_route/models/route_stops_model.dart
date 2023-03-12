import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'route_stops_model.freezed.dart';
part 'route_stops_model.g.dart';

String _toString(dynamic value) => value.toString();
double _toDouble(dynamic value) => double.parse(value);

@freezed
class RouteStops with _$RouteStops {
  static String _toString(dynamic value) => value.toString();
  const factory RouteStops(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString)
          required String statusCode,
      @JsonKey(name: 'MensajeEstado')
          required String statusMessage,
      @JsonKey(name: 'paradas')
          required Map<String, List<RouteStopData>> stops}) = _RouteStops;

  factory RouteStops.fromJson(Map<String, Object?> json) =>
      _$RouteStopsFromJson(json);
}

@freezed
class RouteStopData with _$RouteStopData {
  const factory RouteStopData(
      {@JsonKey(name: 'Codigo', fromJson: _toString)
          required String stopCode,
      @JsonKey(name: 'Identificador', fromJson: _toString)
          required String stopIdentifier,
      @JsonKey(name: 'Descripcion', fromJson: _toString)
          required String description,
      @JsonKey(name: 'AbreviaturaBandera', fromJson: _toString)
          required String pathName,
      @JsonKey(name: 'AbreviaturaAmpliadaBandera', fromJson: _toString)
          required String destination,
      @JsonKey(name: 'LatitudParada', fromJson: _toDouble)
          num? latitude,
      @JsonKey(name: 'LongitudParada', fromJson: _toDouble)
          num? longitude}) = _RouteStopData;

  factory RouteStopData.fromJson(Map<String, Object?> json) =>
      _$RouteStopDataFromJson(json);
}
