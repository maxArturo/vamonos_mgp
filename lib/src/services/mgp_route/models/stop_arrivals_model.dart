import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'stop_arrivals_model.freezed.dart';
part 'stop_arrivals_model.g.dart';

String _toString(dynamic value) => value.toString();
double _toDouble(dynamic value) => double.parse(value);

DateTime _toDate(dynamic el) =>
    DateTime.parse(_toString(el).replaceAll('/', '-'));

@freezed
class StopArrivals with _$StopArrivals {
  static String _toString(dynamic value) => value.toString();
  const factory StopArrivals(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString)
          required String statusCode,
      @JsonKey(name: 'MensajeEstado')
          required String statusMessage,
      @JsonKey(name: 'arribos')
          required List<Arrival> stops}) = _StopArrivals;

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
    @JsonKey(name: 'Latitud', fromJson: _toDouble) num? busLatitude,
    @JsonKey(name: 'Longitud', fromJson: _toDouble) num? busLongitude,
    @JsonKey(name: 'LatitudParada', fromJson: _toDouble) num? stopLatitude,
    @JsonKey(name: 'LongitudParada', fromJson: _toDouble) num? stopLongitude,
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
