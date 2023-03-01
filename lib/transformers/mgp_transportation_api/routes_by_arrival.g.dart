// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes_by_arrival.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutesByArrival _$RoutesByArrivalFromJson(Map<String, dynamic> json) =>
    RoutesByArrival(
      (json['lineas'] as List<dynamic>)
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['CodigoEstado'] as int,
      json['MensajeEstado'] as String,
    );

Map<String, dynamic> _$RoutesByArrivalToJson(RoutesByArrival instance) =>
    <String, dynamic>{
      'CodigoEstado': instance.statusCode,
      'MensajeEstado': instance.statusMessage,
      'lineas': instance.routes,
    };

Route _$RouteFromJson(Map<String, dynamic> json) => Route(
      Route._toString(json['CodigoLineaParada']),
      Route._toString(json['CodigoEmpresa']),
      Route._toString(json['Descripcion']),
      Route._toString(json['CodigoEntidad']),
    );

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'CodigoLineaParada': instance.code,
      'Descripcion': instance.description,
      'CodigoEntidad': instance.entityCode,
      'CodigoEmpresa': instance.companyCode,
    };
