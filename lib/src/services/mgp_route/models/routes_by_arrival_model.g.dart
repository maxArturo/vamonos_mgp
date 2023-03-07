// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes_by_arrival_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoutesByArrival _$$_RoutesByArrivalFromJson(Map<String, dynamic> json) =>
    _$_RoutesByArrival(
      statusCode: _toString(json['CodigoEstado']),
      statusMessage: json['MensajeEstado'] as String,
      routes: (json['lineas'] as List<dynamic>)
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RoutesByArrivalToJson(_$_RoutesByArrival instance) =>
    <String, dynamic>{
      'CodigoEstado': instance.statusCode,
      'MensajeEstado': instance.statusMessage,
      'lineas': instance.routes,
    };

_$_Route _$$_RouteFromJson(Map<String, dynamic> json) => _$_Route(
      code: _toString(json['CodigoLineaParada']),
      description: _toString(json['Descripcion']),
      entityCode: _toString(json['CodigoEntidad']),
      companyCode: _toString(json['CodigoEmpresa']),
    );

Map<String, dynamic> _$$_RouteToJson(_$_Route instance) => <String, dynamic>{
      'CodigoLineaParada': instance.code,
      'Descripcion': instance.description,
      'CodigoEntidad': instance.entityCode,
      'CodigoEmpresa': instance.companyCode,
    };
