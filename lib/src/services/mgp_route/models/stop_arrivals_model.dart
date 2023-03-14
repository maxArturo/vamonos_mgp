import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

part 'stop_arrivals_model.freezed.dart';
part 'stop_arrivals_model.g.dart';

String _toString(dynamic value) => value.toString();
double _toDouble(dynamic value) => double.parse(value);
double? _maybeToDobule(dynamic value) =>
    value.toString().isEmpty ? null : _toDouble(value);

DateFormat format = DateFormat("dd/MM/yyyy hh:mm:ss");
DateTime _toDate(dynamic el) => format.parse(_toString(el));

@freezed
class StopArrivals with _$StopArrivals {
  const factory StopArrivals(
      {@JsonKey(name: 'CodigoEstado') required num statusCode,
      @JsonKey(name: 'MensajeEstado') required String statusMessage,
      @JsonKey(name: 'arribos') required List<Arrival> stops}) = _StopArrivals;

  factory StopArrivals.fromJson(Map<String, Object?> json) =>
      _$StopArrivalsFromJson(json);
}

@freezed
class Arrival with _$Arrival {
  const factory Arrival({
    @JsonKey(name: 'DescripcionLinea', fromJson: _toString)
        required String lineDescription,
    @JsonKey(name: 'DescripcionBandera', fromJson: _toString)
        required String destinationDescription,
    @JsonKey(name: 'Arribo', fromJson: _toString) required String arrival,
    @JsonKey(name: 'Latitud', fromJson: _maybeToDobule) num? busLatitude,
    @JsonKey(name: 'Longitud', fromJson: _maybeToDobule) num? busLongitude,
    @JsonKey(name: 'LatitudParada', fromJson: _maybeToDobule) num? stopLatitude,
    @JsonKey(name: 'LongitudParada', fromJson: _maybeToDobule)
        num? stopLongitude,
    @JsonKey(name: 'DescripcionCortaBandera', fromJson: _toString)
        required String shortDestinationDescription,
    @JsonKey(name: 'DescripcionCartelBandera', fromJson: _toString)
        required String busLabelDescription,
    @JsonKey(name: 'IdentificadorCoche', fromJson: _toString)
        required String busId,
    @JsonKey(name: 'IdentificadorChofer', fromJson: _toString)
        required String driverId,
    @JsonKey(name: "DesvioHorario", fromJson: _toString)
        required String appointmentDelta,
    @JsonKey(name: "UltimaFechaHoraGPS", fromJson: _toDate)
        required DateTime lastGpsPing,
    @JsonKey(name: "CodigoLineaParada", fromJson: _toString)
        required String lineCode,
  }) = _Arrival;

  factory Arrival.fromJson(Map<String, Object?> json) =>
      _$ArrivalFromJson(json);
}
