import 'package:json_annotation/json_annotation.dart';

part 'routes_by_arrival.g.dart';

@JsonSerializable()
class RoutesByArrival {
  RoutesByArrival(this.routes, this.statusCode, this.statusMessage);
  @JsonKey(name: 'CodigoEstado')
  final int statusCode;
  @JsonKey(name: 'MensajeEstado')
  final String statusMessage;
  @JsonKey(name: 'lineas')
  final List<Route> routes;

  factory RoutesByArrival.fromJson(Map<String, dynamic> json) =>
      _$RoutesByArrivalFromJson(json);

  Map<String, dynamic> toJson() => _$RoutesByArrivalToJson(this);
}

@JsonSerializable()
class Route {
  Route(this.code, this.companyCode, this.description, this.entityCode);

  @JsonKey(name: 'CodigoLineaParada', fromJson: _toString)
  final String code;
  @JsonKey(name: 'Descripcion', fromJson: _toString)
  final String description;
  @JsonKey(name: 'CodigoEntidad', fromJson: _toString)
  final String entityCode;
  @JsonKey(name: 'CodigoEmpresa', fromJson: _toString)
  final String companyCode;

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);

  Map<String, dynamic> toJson() => _$RouteToJson(this);

  static String _toString(dynamic value) => value.toString();
}
