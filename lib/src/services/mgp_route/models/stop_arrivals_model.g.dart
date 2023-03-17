// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_arrivals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StopArrivals _$$_StopArrivalsFromJson(Map<String, dynamic> json) =>
    _$_StopArrivals(
      statusCode: json['CodigoEstado'] as num,
      statusMessage: json['MensajeEstado'] as String,
      stops: (json['arribos'] as List<dynamic>?)
          ?.map((e) => Arrival.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StopArrivalsToJson(_$_StopArrivals instance) =>
    <String, dynamic>{
      'CodigoEstado': instance.statusCode,
      'MensajeEstado': instance.statusMessage,
      'arribos': instance.stops,
    };

_$_Arrival _$$_ArrivalFromJson(Map<String, dynamic> json) => _$_Arrival(
      lineDescription: _toString(json['DescripcionLinea']),
      destinationDescription: _toString(json['DescripcionBandera']),
      arrival: _toString(json['Arribo']),
      busLatitude: _maybeToDobule(json['Latitud']),
      busLongitude: _maybeToDobule(json['Longitud']),
      stopLatitude: _maybeToDobule(json['LatitudParada']),
      stopLongitude: _maybeToDobule(json['LongitudParada']),
      shortDestinationDescription: _toString(json['DescripcionCortaBandera']),
      busLabelDescription: _toString(json['DescripcionCartelBandera']),
      busId: _toString(json['IdentificadorCoche']),
      driverId: _toString(json['IdentificadorChofer']),
      appointmentDelta: _toString(json['DesvioHorario']),
      lastGpsPing: _toDate(json['UltimaFechaHoraGPS']),
      lineCode: _toString(json['CodigoLineaParada']),
    );

Map<String, dynamic> _$$_ArrivalToJson(_$_Arrival instance) =>
    <String, dynamic>{
      'DescripcionLinea': instance.lineDescription,
      'DescripcionBandera': instance.destinationDescription,
      'Arribo': instance.arrival,
      'Latitud': instance.busLatitude,
      'Longitud': instance.busLongitude,
      'LatitudParada': instance.stopLatitude,
      'LongitudParada': instance.stopLongitude,
      'DescripcionCortaBandera': instance.shortDestinationDescription,
      'DescripcionCartelBandera': instance.busLabelDescription,
      'IdentificadorCoche': instance.busId,
      'IdentificadorChofer': instance.driverId,
      'DesvioHorario': instance.appointmentDelta,
      'UltimaFechaHoraGPS': instance.lastGpsPing.toIso8601String(),
      'CodigoLineaParada': instance.lineCode,
    };
