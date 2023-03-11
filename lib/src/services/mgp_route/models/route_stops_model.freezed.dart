// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_stops_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RouteStops _$RouteStopsFromJson(Map<String, dynamic> json) {
  return _RouteStops.fromJson(json);
}

/// @nodoc
mixin _$RouteStops {
  @JsonKey(name: 'CodigoEstado', fromJson: _toString)
  String get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'MensajeEstado')
  String get statusMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'paradas')
  Map<String, List<RouteStopData>> get stops =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteStopsCopyWith<RouteStops> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteStopsCopyWith<$Res> {
  factory $RouteStopsCopyWith(
          RouteStops value, $Res Function(RouteStops) then) =
      _$RouteStopsCopyWithImpl<$Res, RouteStops>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString) String statusCode,
      @JsonKey(name: 'MensajeEstado') String statusMessage,
      @JsonKey(name: 'paradas') Map<String, List<RouteStopData>> stops});
}

/// @nodoc
class _$RouteStopsCopyWithImpl<$Res, $Val extends RouteStops>
    implements $RouteStopsCopyWith<$Res> {
  _$RouteStopsCopyWithImpl(this._value, this._then);

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
              as String,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      stops: null == stops
          ? _value.stops
          : stops // ignore: cast_nullable_to_non_nullable
              as Map<String, List<RouteStopData>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RouteStopsCopyWith<$Res>
    implements $RouteStopsCopyWith<$Res> {
  factory _$$_RouteStopsCopyWith(
          _$_RouteStops value, $Res Function(_$_RouteStops) then) =
      __$$_RouteStopsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString) String statusCode,
      @JsonKey(name: 'MensajeEstado') String statusMessage,
      @JsonKey(name: 'paradas') Map<String, List<RouteStopData>> stops});
}

/// @nodoc
class __$$_RouteStopsCopyWithImpl<$Res>
    extends _$RouteStopsCopyWithImpl<$Res, _$_RouteStops>
    implements _$$_RouteStopsCopyWith<$Res> {
  __$$_RouteStopsCopyWithImpl(
      _$_RouteStops _value, $Res Function(_$_RouteStops) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? stops = null,
  }) {
    return _then(_$_RouteStops(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      stops: null == stops
          ? _value._stops
          : stops // ignore: cast_nullable_to_non_nullable
              as Map<String, List<RouteStopData>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RouteStops with DiagnosticableTreeMixin implements _RouteStops {
  const _$_RouteStops(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString)
          required this.statusCode,
      @JsonKey(name: 'MensajeEstado')
          required this.statusMessage,
      @JsonKey(name: 'paradas')
          required final Map<String, List<RouteStopData>> stops})
      : _stops = stops;

  factory _$_RouteStops.fromJson(Map<String, dynamic> json) =>
      _$$_RouteStopsFromJson(json);

  @override
  @JsonKey(name: 'CodigoEstado', fromJson: _toString)
  final String statusCode;
  @override
  @JsonKey(name: 'MensajeEstado')
  final String statusMessage;
  final Map<String, List<RouteStopData>> _stops;
  @override
  @JsonKey(name: 'paradas')
  Map<String, List<RouteStopData>> get stops {
    if (_stops is EqualUnmodifiableMapView) return _stops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stops);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RouteStops(statusCode: $statusCode, statusMessage: $statusMessage, stops: $stops)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RouteStops'))
      ..add(DiagnosticsProperty('statusCode', statusCode))
      ..add(DiagnosticsProperty('statusMessage', statusMessage))
      ..add(DiagnosticsProperty('stops', stops));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RouteStops &&
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
  _$$_RouteStopsCopyWith<_$_RouteStops> get copyWith =>
      __$$_RouteStopsCopyWithImpl<_$_RouteStops>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RouteStopsToJson(
      this,
    );
  }
}

abstract class _RouteStops implements RouteStops {
  const factory _RouteStops(
          {@JsonKey(name: 'CodigoEstado', fromJson: _toString)
              required final String statusCode,
          @JsonKey(name: 'MensajeEstado')
              required final String statusMessage,
          @JsonKey(name: 'paradas')
              required final Map<String, List<RouteStopData>> stops}) =
      _$_RouteStops;

  factory _RouteStops.fromJson(Map<String, dynamic> json) =
      _$_RouteStops.fromJson;

  @override
  @JsonKey(name: 'CodigoEstado', fromJson: _toString)
  String get statusCode;
  @override
  @JsonKey(name: 'MensajeEstado')
  String get statusMessage;
  @override
  @JsonKey(name: 'paradas')
  Map<String, List<RouteStopData>> get stops;
  @override
  @JsonKey(ignore: true)
  _$$_RouteStopsCopyWith<_$_RouteStops> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteStopData _$RouteStopDataFromJson(Map<String, dynamic> json) {
  return _RouteStopData.fromJson(json);
}

/// @nodoc
mixin _$RouteStopData {
  @JsonKey(name: 'Codigo', fromJson: _toString)
  String get stopCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Identificador', fromJson: _toString)
  String get stopIdentifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'Descripcion', fromJson: _toString)
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'AbreviaturaBandera', fromJson: _toString)
  String get stopAbbreviatedDirection => throw _privateConstructorUsedError;
  @JsonKey(name: 'AbreviaturaAmpliadaBandera', fromJson: _toString)
  String get stopExtendedDirection => throw _privateConstructorUsedError;
  @JsonKey(name: 'LatitudParada', fromJson: _toDouble)
  num? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'LongitudParada', fromJson: _toDouble)
  num? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteStopDataCopyWith<RouteStopData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteStopDataCopyWith<$Res> {
  factory $RouteStopDataCopyWith(
          RouteStopData value, $Res Function(RouteStopData) then) =
      _$RouteStopDataCopyWithImpl<$Res, RouteStopData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Codigo', fromJson: _toString)
          String stopCode,
      @JsonKey(name: 'Identificador', fromJson: _toString)
          String stopIdentifier,
      @JsonKey(name: 'Descripcion', fromJson: _toString)
          String description,
      @JsonKey(name: 'AbreviaturaBandera', fromJson: _toString)
          String stopAbbreviatedDirection,
      @JsonKey(name: 'AbreviaturaAmpliadaBandera', fromJson: _toString)
          String stopExtendedDirection,
      @JsonKey(name: 'LatitudParada', fromJson: _toDouble)
          num? latitude,
      @JsonKey(name: 'LongitudParada', fromJson: _toDouble)
          num? longitude});
}

/// @nodoc
class _$RouteStopDataCopyWithImpl<$Res, $Val extends RouteStopData>
    implements $RouteStopDataCopyWith<$Res> {
  _$RouteStopDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopCode = null,
    Object? stopIdentifier = null,
    Object? description = null,
    Object? stopAbbreviatedDirection = null,
    Object? stopExtendedDirection = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      stopCode: null == stopCode
          ? _value.stopCode
          : stopCode // ignore: cast_nullable_to_non_nullable
              as String,
      stopIdentifier: null == stopIdentifier
          ? _value.stopIdentifier
          : stopIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stopAbbreviatedDirection: null == stopAbbreviatedDirection
          ? _value.stopAbbreviatedDirection
          : stopAbbreviatedDirection // ignore: cast_nullable_to_non_nullable
              as String,
      stopExtendedDirection: null == stopExtendedDirection
          ? _value.stopExtendedDirection
          : stopExtendedDirection // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RouteStopDataCopyWith<$Res>
    implements $RouteStopDataCopyWith<$Res> {
  factory _$$_RouteStopDataCopyWith(
          _$_RouteStopData value, $Res Function(_$_RouteStopData) then) =
      __$$_RouteStopDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Codigo', fromJson: _toString)
          String stopCode,
      @JsonKey(name: 'Identificador', fromJson: _toString)
          String stopIdentifier,
      @JsonKey(name: 'Descripcion', fromJson: _toString)
          String description,
      @JsonKey(name: 'AbreviaturaBandera', fromJson: _toString)
          String stopAbbreviatedDirection,
      @JsonKey(name: 'AbreviaturaAmpliadaBandera', fromJson: _toString)
          String stopExtendedDirection,
      @JsonKey(name: 'LatitudParada', fromJson: _toDouble)
          num? latitude,
      @JsonKey(name: 'LongitudParada', fromJson: _toDouble)
          num? longitude});
}

/// @nodoc
class __$$_RouteStopDataCopyWithImpl<$Res>
    extends _$RouteStopDataCopyWithImpl<$Res, _$_RouteStopData>
    implements _$$_RouteStopDataCopyWith<$Res> {
  __$$_RouteStopDataCopyWithImpl(
      _$_RouteStopData _value, $Res Function(_$_RouteStopData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopCode = null,
    Object? stopIdentifier = null,
    Object? description = null,
    Object? stopAbbreviatedDirection = null,
    Object? stopExtendedDirection = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_RouteStopData(
      stopCode: null == stopCode
          ? _value.stopCode
          : stopCode // ignore: cast_nullable_to_non_nullable
              as String,
      stopIdentifier: null == stopIdentifier
          ? _value.stopIdentifier
          : stopIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stopAbbreviatedDirection: null == stopAbbreviatedDirection
          ? _value.stopAbbreviatedDirection
          : stopAbbreviatedDirection // ignore: cast_nullable_to_non_nullable
              as String,
      stopExtendedDirection: null == stopExtendedDirection
          ? _value.stopExtendedDirection
          : stopExtendedDirection // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RouteStopData with DiagnosticableTreeMixin implements _RouteStopData {
  const _$_RouteStopData(
      {@JsonKey(name: 'Codigo', fromJson: _toString)
          required this.stopCode,
      @JsonKey(name: 'Identificador', fromJson: _toString)
          required this.stopIdentifier,
      @JsonKey(name: 'Descripcion', fromJson: _toString)
          required this.description,
      @JsonKey(name: 'AbreviaturaBandera', fromJson: _toString)
          required this.stopAbbreviatedDirection,
      @JsonKey(name: 'AbreviaturaAmpliadaBandera', fromJson: _toString)
          required this.stopExtendedDirection,
      @JsonKey(name: 'LatitudParada', fromJson: _toDouble)
          this.latitude,
      @JsonKey(name: 'LongitudParada', fromJson: _toDouble)
          this.longitude});

  factory _$_RouteStopData.fromJson(Map<String, dynamic> json) =>
      _$$_RouteStopDataFromJson(json);

  @override
  @JsonKey(name: 'Codigo', fromJson: _toString)
  final String stopCode;
  @override
  @JsonKey(name: 'Identificador', fromJson: _toString)
  final String stopIdentifier;
  @override
  @JsonKey(name: 'Descripcion', fromJson: _toString)
  final String description;
  @override
  @JsonKey(name: 'AbreviaturaBandera', fromJson: _toString)
  final String stopAbbreviatedDirection;
  @override
  @JsonKey(name: 'AbreviaturaAmpliadaBandera', fromJson: _toString)
  final String stopExtendedDirection;
  @override
  @JsonKey(name: 'LatitudParada', fromJson: _toDouble)
  final num? latitude;
  @override
  @JsonKey(name: 'LongitudParada', fromJson: _toDouble)
  final num? longitude;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RouteStopData(stopCode: $stopCode, stopIdentifier: $stopIdentifier, description: $description, stopAbbreviatedDirection: $stopAbbreviatedDirection, stopExtendedDirection: $stopExtendedDirection, latitude: $latitude, longitude: $longitude)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RouteStopData'))
      ..add(DiagnosticsProperty('stopCode', stopCode))
      ..add(DiagnosticsProperty('stopIdentifier', stopIdentifier))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty(
          'stopAbbreviatedDirection', stopAbbreviatedDirection))
      ..add(DiagnosticsProperty('stopExtendedDirection', stopExtendedDirection))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RouteStopData &&
            (identical(other.stopCode, stopCode) ||
                other.stopCode == stopCode) &&
            (identical(other.stopIdentifier, stopIdentifier) ||
                other.stopIdentifier == stopIdentifier) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(
                    other.stopAbbreviatedDirection, stopAbbreviatedDirection) ||
                other.stopAbbreviatedDirection == stopAbbreviatedDirection) &&
            (identical(other.stopExtendedDirection, stopExtendedDirection) ||
                other.stopExtendedDirection == stopExtendedDirection) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      stopCode,
      stopIdentifier,
      description,
      stopAbbreviatedDirection,
      stopExtendedDirection,
      latitude,
      longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RouteStopDataCopyWith<_$_RouteStopData> get copyWith =>
      __$$_RouteStopDataCopyWithImpl<_$_RouteStopData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RouteStopDataToJson(
      this,
    );
  }
}

abstract class _RouteStopData implements RouteStopData {
  const factory _RouteStopData(
      {@JsonKey(name: 'Codigo', fromJson: _toString)
          required final String stopCode,
      @JsonKey(name: 'Identificador', fromJson: _toString)
          required final String stopIdentifier,
      @JsonKey(name: 'Descripcion', fromJson: _toString)
          required final String description,
      @JsonKey(name: 'AbreviaturaBandera', fromJson: _toString)
          required final String stopAbbreviatedDirection,
      @JsonKey(name: 'AbreviaturaAmpliadaBandera', fromJson: _toString)
          required final String stopExtendedDirection,
      @JsonKey(name: 'LatitudParada', fromJson: _toDouble)
          final num? latitude,
      @JsonKey(name: 'LongitudParada', fromJson: _toDouble)
          final num? longitude}) = _$_RouteStopData;

  factory _RouteStopData.fromJson(Map<String, dynamic> json) =
      _$_RouteStopData.fromJson;

  @override
  @JsonKey(name: 'Codigo', fromJson: _toString)
  String get stopCode;
  @override
  @JsonKey(name: 'Identificador', fromJson: _toString)
  String get stopIdentifier;
  @override
  @JsonKey(name: 'Descripcion', fromJson: _toString)
  String get description;
  @override
  @JsonKey(name: 'AbreviaturaBandera', fromJson: _toString)
  String get stopAbbreviatedDirection;
  @override
  @JsonKey(name: 'AbreviaturaAmpliadaBandera', fromJson: _toString)
  String get stopExtendedDirection;
  @override
  @JsonKey(name: 'LatitudParada', fromJson: _toDouble)
  num? get latitude;
  @override
  @JsonKey(name: 'LongitudParada', fromJson: _toDouble)
  num? get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_RouteStopDataCopyWith<_$_RouteStopData> get copyWith =>
      throw _privateConstructorUsedError;
}
