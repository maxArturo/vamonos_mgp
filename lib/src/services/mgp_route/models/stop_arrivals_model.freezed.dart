// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stop_arrivals_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StopArrivals _$StopArrivalsFromJson(Map<String, dynamic> json) {
  return _StopArrivals.fromJson(json);
}

/// @nodoc
mixin _$StopArrivals {
  @JsonKey(name: 'CodigoEstado')
  num get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'MensajeEstado')
  String get statusMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'arribos')
  List<Arrival> get stops => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StopArrivalsCopyWith<StopArrivals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopArrivalsCopyWith<$Res> {
  factory $StopArrivalsCopyWith(
          StopArrivals value, $Res Function(StopArrivals) then) =
      _$StopArrivalsCopyWithImpl<$Res, StopArrivals>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CodigoEstado') num statusCode,
      @JsonKey(name: 'MensajeEstado') String statusMessage,
      @JsonKey(name: 'arribos') List<Arrival> stops});
}

/// @nodoc
class _$StopArrivalsCopyWithImpl<$Res, $Val extends StopArrivals>
    implements $StopArrivalsCopyWith<$Res> {
  _$StopArrivalsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? stops = null,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as num,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      stops: null == stops
          ? _value.stops
          : stops // ignore: cast_nullable_to_non_nullable
              as List<Arrival>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StopArrivalsCopyWith<$Res>
    implements $StopArrivalsCopyWith<$Res> {
  factory _$$_StopArrivalsCopyWith(
          _$_StopArrivals value, $Res Function(_$_StopArrivals) then) =
      __$$_StopArrivalsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CodigoEstado') num statusCode,
      @JsonKey(name: 'MensajeEstado') String statusMessage,
      @JsonKey(name: 'arribos') List<Arrival> stops});
}

/// @nodoc
class __$$_StopArrivalsCopyWithImpl<$Res>
    extends _$StopArrivalsCopyWithImpl<$Res, _$_StopArrivals>
    implements _$$_StopArrivalsCopyWith<$Res> {
  __$$_StopArrivalsCopyWithImpl(
      _$_StopArrivals _value, $Res Function(_$_StopArrivals) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? stops = null,
  }) {
    return _then(_$_StopArrivals(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as num,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      stops: null == stops
          ? _value._stops
          : stops // ignore: cast_nullable_to_non_nullable
              as List<Arrival>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StopArrivals with DiagnosticableTreeMixin implements _StopArrivals {
  const _$_StopArrivals(
      {@JsonKey(name: 'CodigoEstado') required this.statusCode,
      @JsonKey(name: 'MensajeEstado') required this.statusMessage,
      @JsonKey(name: 'arribos') required final List<Arrival> stops})
      : _stops = stops;

  factory _$_StopArrivals.fromJson(Map<String, dynamic> json) =>
      _$$_StopArrivalsFromJson(json);

  @override
  @JsonKey(name: 'CodigoEstado')
  final num statusCode;
  @override
  @JsonKey(name: 'MensajeEstado')
  final String statusMessage;
  final List<Arrival> _stops;
  @override
  @JsonKey(name: 'arribos')
  List<Arrival> get stops {
    if (_stops is EqualUnmodifiableListView) return _stops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stops);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StopArrivals(statusCode: $statusCode, statusMessage: $statusMessage, stops: $stops)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StopArrivals'))
      ..add(DiagnosticsProperty('statusCode', statusCode))
      ..add(DiagnosticsProperty('statusMessage', statusMessage))
      ..add(DiagnosticsProperty('stops', stops));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StopArrivals &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            const DeepCollectionEquality().equals(other._stops, _stops));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      const DeepCollectionEquality().hash(_stops));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StopArrivalsCopyWith<_$_StopArrivals> get copyWith =>
      __$$_StopArrivalsCopyWithImpl<_$_StopArrivals>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StopArrivalsToJson(
      this,
    );
  }
}

abstract class _StopArrivals implements StopArrivals {
  const factory _StopArrivals(
          {@JsonKey(name: 'CodigoEstado') required final num statusCode,
          @JsonKey(name: 'MensajeEstado') required final String statusMessage,
          @JsonKey(name: 'arribos') required final List<Arrival> stops}) =
      _$_StopArrivals;

  factory _StopArrivals.fromJson(Map<String, dynamic> json) =
      _$_StopArrivals.fromJson;

  @override
  @JsonKey(name: 'CodigoEstado')
  num get statusCode;
  @override
  @JsonKey(name: 'MensajeEstado')
  String get statusMessage;
  @override
  @JsonKey(name: 'arribos')
  List<Arrival> get stops;
  @override
  @JsonKey(ignore: true)
  _$$_StopArrivalsCopyWith<_$_StopArrivals> get copyWith =>
      throw _privateConstructorUsedError;
}

Arrival _$ArrivalFromJson(Map<String, dynamic> json) {
  return _Arrival.fromJson(json);
}

/// @nodoc
mixin _$Arrival {
  @JsonKey(name: 'DescripcionLinea', fromJson: _toString)
  String get lineDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'DescripcionBandera', fromJson: _toString)
  String get destinationDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'Arribo', fromJson: _toString)
  String get arrival => throw _privateConstructorUsedError;
  @JsonKey(name: 'Latitud', fromJson: _maybeToDobule)
  num? get busLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'Longitud', fromJson: _maybeToDobule)
  num? get busLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'LatitudParada', fromJson: _maybeToDobule)
  num? get stopLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'LongitudParada', fromJson: _maybeToDobule)
  num? get stopLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'DescripcionCortaBandera', fromJson: _toString)
  String get shortDestinationDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'DescripcionCartelBandera', fromJson: _toString)
  String get busLabelDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'IdentificadorCoche', fromJson: _toString)
  String get busId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IdentificadorChofer', fromJson: _toString)
  String get driverId => throw _privateConstructorUsedError;
  @JsonKey(name: "DesvioHorario", fromJson: _toString)
  String get appointmentDelta => throw _privateConstructorUsedError;
  @JsonKey(name: "UltimaFechaHoraGPS", fromJson: _toDate)
  DateTime get lastGpsPing => throw _privateConstructorUsedError;
  @JsonKey(name: "CodigoLineaParada", fromJson: _toString)
  String get lineCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArrivalCopyWith<Arrival> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArrivalCopyWith<$Res> {
  factory $ArrivalCopyWith(Arrival value, $Res Function(Arrival) then) =
      _$ArrivalCopyWithImpl<$Res, Arrival>;
  @useResult
  $Res call(
      {@JsonKey(name: 'DescripcionLinea', fromJson: _toString)
          String lineDescription,
      @JsonKey(name: 'DescripcionBandera', fromJson: _toString)
          String destinationDescription,
      @JsonKey(name: 'Arribo', fromJson: _toString)
          String arrival,
      @JsonKey(name: 'Latitud', fromJson: _maybeToDobule)
          num? busLatitude,
      @JsonKey(name: 'Longitud', fromJson: _maybeToDobule)
          num? busLongitude,
      @JsonKey(name: 'LatitudParada', fromJson: _maybeToDobule)
          num? stopLatitude,
      @JsonKey(name: 'LongitudParada', fromJson: _maybeToDobule)
          num? stopLongitude,
      @JsonKey(name: 'DescripcionCortaBandera', fromJson: _toString)
          String shortDestinationDescription,
      @JsonKey(name: 'DescripcionCartelBandera', fromJson: _toString)
          String busLabelDescription,
      @JsonKey(name: 'IdentificadorCoche', fromJson: _toString)
          String busId,
      @JsonKey(name: 'IdentificadorChofer', fromJson: _toString)
          String driverId,
      @JsonKey(name: "DesvioHorario", fromJson: _toString)
          String appointmentDelta,
      @JsonKey(name: "UltimaFechaHoraGPS", fromJson: _toDate)
          DateTime lastGpsPing,
      @JsonKey(name: "CodigoLineaParada", fromJson: _toString)
          String lineCode});
}

/// @nodoc
class _$ArrivalCopyWithImpl<$Res, $Val extends Arrival>
    implements $ArrivalCopyWith<$Res> {
  _$ArrivalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lineDescription = null,
    Object? destinationDescription = null,
    Object? arrival = null,
    Object? busLatitude = freezed,
    Object? busLongitude = freezed,
    Object? stopLatitude = freezed,
    Object? stopLongitude = freezed,
    Object? shortDestinationDescription = null,
    Object? busLabelDescription = null,
    Object? busId = null,
    Object? driverId = null,
    Object? appointmentDelta = null,
    Object? lastGpsPing = null,
    Object? lineCode = null,
  }) {
    return _then(_value.copyWith(
      lineDescription: null == lineDescription
          ? _value.lineDescription
          : lineDescription // ignore: cast_nullable_to_non_nullable
              as String,
      destinationDescription: null == destinationDescription
          ? _value.destinationDescription
          : destinationDescription // ignore: cast_nullable_to_non_nullable
              as String,
      arrival: null == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as String,
      busLatitude: freezed == busLatitude
          ? _value.busLatitude
          : busLatitude // ignore: cast_nullable_to_non_nullable
              as num?,
      busLongitude: freezed == busLongitude
          ? _value.busLongitude
          : busLongitude // ignore: cast_nullable_to_non_nullable
              as num?,
      stopLatitude: freezed == stopLatitude
          ? _value.stopLatitude
          : stopLatitude // ignore: cast_nullable_to_non_nullable
              as num?,
      stopLongitude: freezed == stopLongitude
          ? _value.stopLongitude
          : stopLongitude // ignore: cast_nullable_to_non_nullable
              as num?,
      shortDestinationDescription: null == shortDestinationDescription
          ? _value.shortDestinationDescription
          : shortDestinationDescription // ignore: cast_nullable_to_non_nullable
              as String,
      busLabelDescription: null == busLabelDescription
          ? _value.busLabelDescription
          : busLabelDescription // ignore: cast_nullable_to_non_nullable
              as String,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDelta: null == appointmentDelta
          ? _value.appointmentDelta
          : appointmentDelta // ignore: cast_nullable_to_non_nullable
              as String,
      lastGpsPing: null == lastGpsPing
          ? _value.lastGpsPing
          : lastGpsPing // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lineCode: null == lineCode
          ? _value.lineCode
          : lineCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArrivalCopyWith<$Res> implements $ArrivalCopyWith<$Res> {
  factory _$$_ArrivalCopyWith(
          _$_Arrival value, $Res Function(_$_Arrival) then) =
      __$$_ArrivalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DescripcionLinea', fromJson: _toString)
          String lineDescription,
      @JsonKey(name: 'DescripcionBandera', fromJson: _toString)
          String destinationDescription,
      @JsonKey(name: 'Arribo', fromJson: _toString)
          String arrival,
      @JsonKey(name: 'Latitud', fromJson: _maybeToDobule)
          num? busLatitude,
      @JsonKey(name: 'Longitud', fromJson: _maybeToDobule)
          num? busLongitude,
      @JsonKey(name: 'LatitudParada', fromJson: _maybeToDobule)
          num? stopLatitude,
      @JsonKey(name: 'LongitudParada', fromJson: _maybeToDobule)
          num? stopLongitude,
      @JsonKey(name: 'DescripcionCortaBandera', fromJson: _toString)
          String shortDestinationDescription,
      @JsonKey(name: 'DescripcionCartelBandera', fromJson: _toString)
          String busLabelDescription,
      @JsonKey(name: 'IdentificadorCoche', fromJson: _toString)
          String busId,
      @JsonKey(name: 'IdentificadorChofer', fromJson: _toString)
          String driverId,
      @JsonKey(name: "DesvioHorario", fromJson: _toString)
          String appointmentDelta,
      @JsonKey(name: "UltimaFechaHoraGPS", fromJson: _toDate)
          DateTime lastGpsPing,
      @JsonKey(name: "CodigoLineaParada", fromJson: _toString)
          String lineCode});
}

/// @nodoc
class __$$_ArrivalCopyWithImpl<$Res>
    extends _$ArrivalCopyWithImpl<$Res, _$_Arrival>
    implements _$$_ArrivalCopyWith<$Res> {
  __$$_ArrivalCopyWithImpl(_$_Arrival _value, $Res Function(_$_Arrival) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lineDescription = null,
    Object? destinationDescription = null,
    Object? arrival = null,
    Object? busLatitude = freezed,
    Object? busLongitude = freezed,
    Object? stopLatitude = freezed,
    Object? stopLongitude = freezed,
    Object? shortDestinationDescription = null,
    Object? busLabelDescription = null,
    Object? busId = null,
    Object? driverId = null,
    Object? appointmentDelta = null,
    Object? lastGpsPing = null,
    Object? lineCode = null,
  }) {
    return _then(_$_Arrival(
      lineDescription: null == lineDescription
          ? _value.lineDescription
          : lineDescription // ignore: cast_nullable_to_non_nullable
              as String,
      destinationDescription: null == destinationDescription
          ? _value.destinationDescription
          : destinationDescription // ignore: cast_nullable_to_non_nullable
              as String,
      arrival: null == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as String,
      busLatitude: freezed == busLatitude
          ? _value.busLatitude
          : busLatitude // ignore: cast_nullable_to_non_nullable
              as num?,
      busLongitude: freezed == busLongitude
          ? _value.busLongitude
          : busLongitude // ignore: cast_nullable_to_non_nullable
              as num?,
      stopLatitude: freezed == stopLatitude
          ? _value.stopLatitude
          : stopLatitude // ignore: cast_nullable_to_non_nullable
              as num?,
      stopLongitude: freezed == stopLongitude
          ? _value.stopLongitude
          : stopLongitude // ignore: cast_nullable_to_non_nullable
              as num?,
      shortDestinationDescription: null == shortDestinationDescription
          ? _value.shortDestinationDescription
          : shortDestinationDescription // ignore: cast_nullable_to_non_nullable
              as String,
      busLabelDescription: null == busLabelDescription
          ? _value.busLabelDescription
          : busLabelDescription // ignore: cast_nullable_to_non_nullable
              as String,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDelta: null == appointmentDelta
          ? _value.appointmentDelta
          : appointmentDelta // ignore: cast_nullable_to_non_nullable
              as String,
      lastGpsPing: null == lastGpsPing
          ? _value.lastGpsPing
          : lastGpsPing // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lineCode: null == lineCode
          ? _value.lineCode
          : lineCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Arrival with DiagnosticableTreeMixin implements _Arrival {
  const _$_Arrival(
      {@JsonKey(name: 'DescripcionLinea', fromJson: _toString)
          required this.lineDescription,
      @JsonKey(name: 'DescripcionBandera', fromJson: _toString)
          required this.destinationDescription,
      @JsonKey(name: 'Arribo', fromJson: _toString)
          required this.arrival,
      @JsonKey(name: 'Latitud', fromJson: _maybeToDobule)
          this.busLatitude,
      @JsonKey(name: 'Longitud', fromJson: _maybeToDobule)
          this.busLongitude,
      @JsonKey(name: 'LatitudParada', fromJson: _maybeToDobule)
          this.stopLatitude,
      @JsonKey(name: 'LongitudParada', fromJson: _maybeToDobule)
          this.stopLongitude,
      @JsonKey(name: 'DescripcionCortaBandera', fromJson: _toString)
          required this.shortDestinationDescription,
      @JsonKey(name: 'DescripcionCartelBandera', fromJson: _toString)
          required this.busLabelDescription,
      @JsonKey(name: 'IdentificadorCoche', fromJson: _toString)
          required this.busId,
      @JsonKey(name: 'IdentificadorChofer', fromJson: _toString)
          required this.driverId,
      @JsonKey(name: "DesvioHorario", fromJson: _toString)
          required this.appointmentDelta,
      @JsonKey(name: "UltimaFechaHoraGPS", fromJson: _toDate)
          required this.lastGpsPing,
      @JsonKey(name: "CodigoLineaParada", fromJson: _toString)
          required this.lineCode});

  factory _$_Arrival.fromJson(Map<String, dynamic> json) =>
      _$$_ArrivalFromJson(json);

  @override
  @JsonKey(name: 'DescripcionLinea', fromJson: _toString)
  final String lineDescription;
  @override
  @JsonKey(name: 'DescripcionBandera', fromJson: _toString)
  final String destinationDescription;
  @override
  @JsonKey(name: 'Arribo', fromJson: _toString)
  final String arrival;
  @override
  @JsonKey(name: 'Latitud', fromJson: _maybeToDobule)
  final num? busLatitude;
  @override
  @JsonKey(name: 'Longitud', fromJson: _maybeToDobule)
  final num? busLongitude;
  @override
  @JsonKey(name: 'LatitudParada', fromJson: _maybeToDobule)
  final num? stopLatitude;
  @override
  @JsonKey(name: 'LongitudParada', fromJson: _maybeToDobule)
  final num? stopLongitude;
  @override
  @JsonKey(name: 'DescripcionCortaBandera', fromJson: _toString)
  final String shortDestinationDescription;
  @override
  @JsonKey(name: 'DescripcionCartelBandera', fromJson: _toString)
  final String busLabelDescription;
  @override
  @JsonKey(name: 'IdentificadorCoche', fromJson: _toString)
  final String busId;
  @override
  @JsonKey(name: 'IdentificadorChofer', fromJson: _toString)
  final String driverId;
  @override
  @JsonKey(name: "DesvioHorario", fromJson: _toString)
  final String appointmentDelta;
  @override
  @JsonKey(name: "UltimaFechaHoraGPS", fromJson: _toDate)
  final DateTime lastGpsPing;
  @override
  @JsonKey(name: "CodigoLineaParada", fromJson: _toString)
  final String lineCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Arrival(lineDescription: $lineDescription, destinationDescription: $destinationDescription, arrival: $arrival, busLatitude: $busLatitude, busLongitude: $busLongitude, stopLatitude: $stopLatitude, stopLongitude: $stopLongitude, shortDestinationDescription: $shortDestinationDescription, busLabelDescription: $busLabelDescription, busId: $busId, driverId: $driverId, appointmentDelta: $appointmentDelta, lastGpsPing: $lastGpsPing, lineCode: $lineCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Arrival'))
      ..add(DiagnosticsProperty('lineDescription', lineDescription))
      ..add(
          DiagnosticsProperty('destinationDescription', destinationDescription))
      ..add(DiagnosticsProperty('arrival', arrival))
      ..add(DiagnosticsProperty('busLatitude', busLatitude))
      ..add(DiagnosticsProperty('busLongitude', busLongitude))
      ..add(DiagnosticsProperty('stopLatitude', stopLatitude))
      ..add(DiagnosticsProperty('stopLongitude', stopLongitude))
      ..add(DiagnosticsProperty(
          'shortDestinationDescription', shortDestinationDescription))
      ..add(DiagnosticsProperty('busLabelDescription', busLabelDescription))
      ..add(DiagnosticsProperty('busId', busId))
      ..add(DiagnosticsProperty('driverId', driverId))
      ..add(DiagnosticsProperty('appointmentDelta', appointmentDelta))
      ..add(DiagnosticsProperty('lastGpsPing', lastGpsPing))
      ..add(DiagnosticsProperty('lineCode', lineCode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Arrival &&
            (identical(other.lineDescription, lineDescription) ||
                other.lineDescription == lineDescription) &&
            (identical(other.destinationDescription, destinationDescription) ||
                other.destinationDescription == destinationDescription) &&
            (identical(other.arrival, arrival) || other.arrival == arrival) &&
            (identical(other.busLatitude, busLatitude) ||
                other.busLatitude == busLatitude) &&
            (identical(other.busLongitude, busLongitude) ||
                other.busLongitude == busLongitude) &&
            (identical(other.stopLatitude, stopLatitude) ||
                other.stopLatitude == stopLatitude) &&
            (identical(other.stopLongitude, stopLongitude) ||
                other.stopLongitude == stopLongitude) &&
            (identical(other.shortDestinationDescription,
                    shortDestinationDescription) ||
                other.shortDestinationDescription ==
                    shortDestinationDescription) &&
            (identical(other.busLabelDescription, busLabelDescription) ||
                other.busLabelDescription == busLabelDescription) &&
            (identical(other.busId, busId) || other.busId == busId) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.appointmentDelta, appointmentDelta) ||
                other.appointmentDelta == appointmentDelta) &&
            (identical(other.lastGpsPing, lastGpsPing) ||
                other.lastGpsPing == lastGpsPing) &&
            (identical(other.lineCode, lineCode) ||
                other.lineCode == lineCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lineDescription,
      destinationDescription,
      arrival,
      busLatitude,
      busLongitude,
      stopLatitude,
      stopLongitude,
      shortDestinationDescription,
      busLabelDescription,
      busId,
      driverId,
      appointmentDelta,
      lastGpsPing,
      lineCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArrivalCopyWith<_$_Arrival> get copyWith =>
      __$$_ArrivalCopyWithImpl<_$_Arrival>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArrivalToJson(
      this,
    );
  }
}

abstract class _Arrival implements Arrival {
  const factory _Arrival(
      {@JsonKey(name: 'DescripcionLinea', fromJson: _toString)
          required final String lineDescription,
      @JsonKey(name: 'DescripcionBandera', fromJson: _toString)
          required final String destinationDescription,
      @JsonKey(name: 'Arribo', fromJson: _toString)
          required final String arrival,
      @JsonKey(name: 'Latitud', fromJson: _maybeToDobule)
          final num? busLatitude,
      @JsonKey(name: 'Longitud', fromJson: _maybeToDobule)
          final num? busLongitude,
      @JsonKey(name: 'LatitudParada', fromJson: _maybeToDobule)
          final num? stopLatitude,
      @JsonKey(name: 'LongitudParada', fromJson: _maybeToDobule)
          final num? stopLongitude,
      @JsonKey(name: 'DescripcionCortaBandera', fromJson: _toString)
          required final String shortDestinationDescription,
      @JsonKey(name: 'DescripcionCartelBandera', fromJson: _toString)
          required final String busLabelDescription,
      @JsonKey(name: 'IdentificadorCoche', fromJson: _toString)
          required final String busId,
      @JsonKey(name: 'IdentificadorChofer', fromJson: _toString)
          required final String driverId,
      @JsonKey(name: "DesvioHorario", fromJson: _toString)
          required final String appointmentDelta,
      @JsonKey(name: "UltimaFechaHoraGPS", fromJson: _toDate)
          required final DateTime lastGpsPing,
      @JsonKey(name: "CodigoLineaParada", fromJson: _toString)
          required final String lineCode}) = _$_Arrival;

  factory _Arrival.fromJson(Map<String, dynamic> json) = _$_Arrival.fromJson;

  @override
  @JsonKey(name: 'DescripcionLinea', fromJson: _toString)
  String get lineDescription;
  @override
  @JsonKey(name: 'DescripcionBandera', fromJson: _toString)
  String get destinationDescription;
  @override
  @JsonKey(name: 'Arribo', fromJson: _toString)
  String get arrival;
  @override
  @JsonKey(name: 'Latitud', fromJson: _maybeToDobule)
  num? get busLatitude;
  @override
  @JsonKey(name: 'Longitud', fromJson: _maybeToDobule)
  num? get busLongitude;
  @override
  @JsonKey(name: 'LatitudParada', fromJson: _maybeToDobule)
  num? get stopLatitude;
  @override
  @JsonKey(name: 'LongitudParada', fromJson: _maybeToDobule)
  num? get stopLongitude;
  @override
  @JsonKey(name: 'DescripcionCortaBandera', fromJson: _toString)
  String get shortDestinationDescription;
  @override
  @JsonKey(name: 'DescripcionCartelBandera', fromJson: _toString)
  String get busLabelDescription;
  @override
  @JsonKey(name: 'IdentificadorCoche', fromJson: _toString)
  String get busId;
  @override
  @JsonKey(name: 'IdentificadorChofer', fromJson: _toString)
  String get driverId;
  @override
  @JsonKey(name: "DesvioHorario", fromJson: _toString)
  String get appointmentDelta;
  @override
  @JsonKey(name: "UltimaFechaHoraGPS", fromJson: _toDate)
  DateTime get lastGpsPing;
  @override
  @JsonKey(name: "CodigoLineaParada", fromJson: _toString)
  String get lineCode;
  @override
  @JsonKey(ignore: true)
  _$$_ArrivalCopyWith<_$_Arrival> get copyWith =>
      throw _privateConstructorUsedError;
}
