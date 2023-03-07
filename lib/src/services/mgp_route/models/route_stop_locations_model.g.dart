// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_stop_locations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RouteStopLocations _$$_RouteStopLocationsFromJson(
        Map<String, dynamic> json) =>
    _$_RouteStopLocations(
      statusCode: _toString(json['CodigoEstado']),
      statusMessage: json['MensajeEstado'] as String,
      routes: (json['puntos'] as List<dynamic>)
          .map((e) => RouteGeoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RouteStopLocationsToJson(
        _$_RouteStopLocations instance) =>
    <String, dynamic>{
      'CodigoEstado': instance.statusCode,
      'MensajeEstado': instance.statusMessage,
      'puntos': instance.routes,
    };

_$_RouteGeoData _$$_RouteGeoDataFromJson(Map<String, dynamic> json) =>
    _$_RouteGeoData(
      stopAbbreviation: _toString(json['AbreviaturaBanderaSMP']),
      lineAbbreviation: _toString(json['AbreviaturaLineaSMP']),
      isCrossingPoint: json['IsPuntoPaso'] as bool,
      description: _toString(json['Descripcion']),
      latitude: json['Latitud'] as num?,
      longitude: json['Longitud'] as num?,
    );

Map<String, dynamic> _$$_RouteGeoDataToJson(_$_RouteGeoData instance) =>
    <String, dynamic>{
      'AbreviaturaBanderaSMP': instance.stopAbbreviation,
      'AbreviaturaLineaSMP': instance.lineAbbreviation,
      'IsPuntoPaso': instance.isCrossingPoint,
      'Descripcion': instance.description,
      'Latitud': instance.latitude,
      'Longitud': instance.longitude,
    };
