// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_stops_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RouteStops _$$_RouteStopsFromJson(Map<String, dynamic> json) =>
    _$_RouteStops(
      statusCode: _toString(json['CodigoEstado']),
      statusMessage: json['MensajeEstado'] as String,
      stops: (json['paradas'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => RouteStopData.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$$_RouteStopsToJson(_$_RouteStops instance) =>
    <String, dynamic>{
      'CodigoEstado': instance.statusCode,
      'MensajeEstado': instance.statusMessage,
      'paradas': instance.stops,
    };

_$_RouteStopData _$$_RouteStopDataFromJson(Map<String, dynamic> json) =>
    _$_RouteStopData(
      stopCode: _toString(json['Codigo']),
      stopIdentifier: _toString(json['Identificador']),
      description: _toString(json['Descripcion']),
      stopAbbreviatedDirection: _toString(json['AbreviaturaBandera']),
      stopExtendedDirection: _toString(json['AbreviaturaAmpliadaBandera']),
      latitude: _toDouble(json['LatitudParada']),
      longitude: _toDouble(json['LongitudParada']),
    );

Map<String, dynamic> _$$_RouteStopDataToJson(_$_RouteStopData instance) =>
    <String, dynamic>{
      'Codigo': instance.stopCode,
      'Identificador': instance.stopIdentifier,
      'Descripcion': instance.description,
      'AbreviaturaBandera': instance.stopAbbreviatedDirection,
      'AbreviaturaAmpliadaBandera': instance.stopExtendedDirection,
      'LatitudParada': instance.latitude,
      'LongitudParada': instance.longitude,
    };
