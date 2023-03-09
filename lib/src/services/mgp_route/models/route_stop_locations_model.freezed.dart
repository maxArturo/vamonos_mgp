// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_stop_locations_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RouteStopLocations _$RouteStopLocationsFromJson(Map<String, dynamic> json) {
  return _RouteStopLocations.fromJson(json);
}

/// @nodoc
mixin _$RouteStopLocations {
  @JsonKey(name: 'CodigoEstado', fromJson: _toString)
  String get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'MensajeEstado')
  String get statusMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'puntos')
  List<RouteGeoData> get routes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteStopLocationsCopyWith<RouteStopLocations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteStopLocationsCopyWith<$Res> {
  factory $RouteStopLocationsCopyWith(
          RouteStopLocations value, $Res Function(RouteStopLocations) then) =
      _$RouteStopLocationsCopyWithImpl<$Res, RouteStopLocations>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString) String statusCode,
      @JsonKey(name: 'MensajeEstado') String statusMessage,
      @JsonKey(name: 'puntos') List<RouteGeoData> routes});
}

/// @nodoc
class _$RouteStopLocationsCopyWithImpl<$Res, $Val extends RouteStopLocations>
    implements $RouteStopLocationsCopyWith<$Res> {
  _$RouteStopLocationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? routes = null,
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
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteGeoData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RouteStopLocationsCopyWith<$Res>
    implements $RouteStopLocationsCopyWith<$Res> {
  factory _$$_RouteStopLocationsCopyWith(_$_RouteStopLocations value,
          $Res Function(_$_RouteStopLocations) then) =
      __$$_RouteStopLocationsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString) String statusCode,
      @JsonKey(name: 'MensajeEstado') String statusMessage,
      @JsonKey(name: 'puntos') List<RouteGeoData> routes});
}

/// @nodoc
class __$$_RouteStopLocationsCopyWithImpl<$Res>
    extends _$RouteStopLocationsCopyWithImpl<$Res, _$_RouteStopLocations>
    implements _$$_RouteStopLocationsCopyWith<$Res> {
  __$$_RouteStopLocationsCopyWithImpl(
      _$_RouteStopLocations _value, $Res Function(_$_RouteStopLocations) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? routes = null,
  }) {
    return _then(_$_RouteStopLocations(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      routes: null == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteGeoData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RouteStopLocations
    with DiagnosticableTreeMixin
    implements _RouteStopLocations {
  const _$_RouteStopLocations(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString)
          required this.statusCode,
      @JsonKey(name: 'MensajeEstado')
          required this.statusMessage,
      @JsonKey(name: 'puntos')
          required final List<RouteGeoData> routes})
      : _routes = routes;

  factory _$_RouteStopLocations.fromJson(Map<String, dynamic> json) =>
      _$$_RouteStopLocationsFromJson(json);

  @override
  @JsonKey(name: 'CodigoEstado', fromJson: _toString)
  final String statusCode;
  @override
  @JsonKey(name: 'MensajeEstado')
  final String statusMessage;
  final List<RouteGeoData> _routes;
  @override
  @JsonKey(name: 'puntos')
  List<RouteGeoData> get routes {
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routes);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RouteStopLocations(statusCode: $statusCode, statusMessage: $statusMessage, routes: $routes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RouteStopLocations'))
      ..add(DiagnosticsProperty('statusCode', statusCode))
      ..add(DiagnosticsProperty('statusMessage', statusMessage))
      ..add(DiagnosticsProperty('routes', routes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RouteStopLocations &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            const DeepCollectionEquality().equals(other._routes, _routes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      const DeepCollectionEquality().hash(_routes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RouteStopLocationsCopyWith<_$_RouteStopLocations> get copyWith =>
      __$$_RouteStopLocationsCopyWithImpl<_$_RouteStopLocations>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RouteStopLocationsToJson(
      this,
    );
  }
}

abstract class _RouteStopLocations implements RouteStopLocations {
  const factory _RouteStopLocations(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString)
          required final String statusCode,
      @JsonKey(name: 'MensajeEstado')
          required final String statusMessage,
      @JsonKey(name: 'puntos')
          required final List<RouteGeoData> routes}) = _$_RouteStopLocations;

  factory _RouteStopLocations.fromJson(Map<String, dynamic> json) =
      _$_RouteStopLocations.fromJson;

  @override
  @JsonKey(name: 'CodigoEstado', fromJson: _toString)
  String get statusCode;
  @override
  @JsonKey(name: 'MensajeEstado')
  String get statusMessage;
  @override
  @JsonKey(name: 'puntos')
  List<RouteGeoData> get routes;
  @override
  @JsonKey(ignore: true)
  _$$_RouteStopLocationsCopyWith<_$_RouteStopLocations> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteGeoData _$RouteGeoDataFromJson(Map<String, dynamic> json) {
  return _RouteGeoData.fromJson(json);
}

/// @nodoc
mixin _$RouteGeoData {
  @JsonKey(name: 'AbreviaturaBanderaSMP', fromJson: _toString)
  String get routeDirection => throw _privateConstructorUsedError;
  @JsonKey(name: 'AbreviaturaLineaSMP', fromJson: _toString)
  String get lineAbbreviation => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsPuntoPaso')
  bool get isCrossingPoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'Descripcion', fromJson: _toString)
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'Latitud')
  num? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'Longitud')
  num? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteGeoDataCopyWith<RouteGeoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteGeoDataCopyWith<$Res> {
  factory $RouteGeoDataCopyWith(
          RouteGeoData value, $Res Function(RouteGeoData) then) =
      _$RouteGeoDataCopyWithImpl<$Res, RouteGeoData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'AbreviaturaBanderaSMP', fromJson: _toString)
          String routeDirection,
      @JsonKey(name: 'AbreviaturaLineaSMP', fromJson: _toString)
          String lineAbbreviation,
      @JsonKey(name: 'IsPuntoPaso')
          bool isCrossingPoint,
      @JsonKey(name: 'Descripcion', fromJson: _toString)
          String description,
      @JsonKey(name: 'Latitud')
          num? latitude,
      @JsonKey(name: 'Longitud')
          num? longitude});
}

/// @nodoc
class _$RouteGeoDataCopyWithImpl<$Res, $Val extends RouteGeoData>
    implements $RouteGeoDataCopyWith<$Res> {
  _$RouteGeoDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeDirection = null,
    Object? lineAbbreviation = null,
    Object? isCrossingPoint = null,
    Object? description = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      routeDirection: null == routeDirection
          ? _value.routeDirection
          : routeDirection // ignore: cast_nullable_to_non_nullable
              as String,
      lineAbbreviation: null == lineAbbreviation
          ? _value.lineAbbreviation
          : lineAbbreviation // ignore: cast_nullable_to_non_nullable
              as String,
      isCrossingPoint: null == isCrossingPoint
          ? _value.isCrossingPoint
          : isCrossingPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_RouteGeoDataCopyWith<$Res>
    implements $RouteGeoDataCopyWith<$Res> {
  factory _$$_RouteGeoDataCopyWith(
          _$_RouteGeoData value, $Res Function(_$_RouteGeoData) then) =
      __$$_RouteGeoDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'AbreviaturaBanderaSMP', fromJson: _toString)
          String routeDirection,
      @JsonKey(name: 'AbreviaturaLineaSMP', fromJson: _toString)
          String lineAbbreviation,
      @JsonKey(name: 'IsPuntoPaso')
          bool isCrossingPoint,
      @JsonKey(name: 'Descripcion', fromJson: _toString)
          String description,
      @JsonKey(name: 'Latitud')
          num? latitude,
      @JsonKey(name: 'Longitud')
          num? longitude});
}

/// @nodoc
class __$$_RouteGeoDataCopyWithImpl<$Res>
    extends _$RouteGeoDataCopyWithImpl<$Res, _$_RouteGeoData>
    implements _$$_RouteGeoDataCopyWith<$Res> {
  __$$_RouteGeoDataCopyWithImpl(
      _$_RouteGeoData _value, $Res Function(_$_RouteGeoData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeDirection = null,
    Object? lineAbbreviation = null,
    Object? isCrossingPoint = null,
    Object? description = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_RouteGeoData(
      routeDirection: null == routeDirection
          ? _value.routeDirection
          : routeDirection // ignore: cast_nullable_to_non_nullable
              as String,
      lineAbbreviation: null == lineAbbreviation
          ? _value.lineAbbreviation
          : lineAbbreviation // ignore: cast_nullable_to_non_nullable
              as String,
      isCrossingPoint: null == isCrossingPoint
          ? _value.isCrossingPoint
          : isCrossingPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
class _$_RouteGeoData with DiagnosticableTreeMixin implements _RouteGeoData {
  const _$_RouteGeoData(
      {@JsonKey(name: 'AbreviaturaBanderaSMP', fromJson: _toString)
          required this.routeDirection,
      @JsonKey(name: 'AbreviaturaLineaSMP', fromJson: _toString)
          required this.lineAbbreviation,
      @JsonKey(name: 'IsPuntoPaso')
          required this.isCrossingPoint,
      @JsonKey(name: 'Descripcion', fromJson: _toString)
          required this.description,
      @JsonKey(name: 'Latitud')
          this.latitude,
      @JsonKey(name: 'Longitud')
          this.longitude});

  factory _$_RouteGeoData.fromJson(Map<String, dynamic> json) =>
      _$$_RouteGeoDataFromJson(json);

  @override
  @JsonKey(name: 'AbreviaturaBanderaSMP', fromJson: _toString)
  final String routeDirection;
  @override
  @JsonKey(name: 'AbreviaturaLineaSMP', fromJson: _toString)
  final String lineAbbreviation;
  @override
  @JsonKey(name: 'IsPuntoPaso')
  final bool isCrossingPoint;
  @override
  @JsonKey(name: 'Descripcion', fromJson: _toString)
  final String description;
  @override
  @JsonKey(name: 'Latitud')
  final num? latitude;
  @override
  @JsonKey(name: 'Longitud')
  final num? longitude;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RouteGeoData(routeDirection: $routeDirection, lineAbbreviation: $lineAbbreviation, isCrossingPoint: $isCrossingPoint, description: $description, latitude: $latitude, longitude: $longitude)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RouteGeoData'))
      ..add(DiagnosticsProperty('routeDirection', routeDirection))
      ..add(DiagnosticsProperty('lineAbbreviation', lineAbbreviation))
      ..add(DiagnosticsProperty('isCrossingPoint', isCrossingPoint))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RouteGeoData &&
            (identical(other.routeDirection, routeDirection) ||
                other.routeDirection == routeDirection) &&
            (identical(other.lineAbbreviation, lineAbbreviation) ||
                other.lineAbbreviation == lineAbbreviation) &&
            (identical(other.isCrossingPoint, isCrossingPoint) ||
                other.isCrossingPoint == isCrossingPoint) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, routeDirection, lineAbbreviation,
      isCrossingPoint, description, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RouteGeoDataCopyWith<_$_RouteGeoData> get copyWith =>
      __$$_RouteGeoDataCopyWithImpl<_$_RouteGeoData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RouteGeoDataToJson(
      this,
    );
  }
}

abstract class _RouteGeoData implements RouteGeoData {
  const factory _RouteGeoData(
      {@JsonKey(name: 'AbreviaturaBanderaSMP', fromJson: _toString)
          required final String routeDirection,
      @JsonKey(name: 'AbreviaturaLineaSMP', fromJson: _toString)
          required final String lineAbbreviation,
      @JsonKey(name: 'IsPuntoPaso')
          required final bool isCrossingPoint,
      @JsonKey(name: 'Descripcion', fromJson: _toString)
          required final String description,
      @JsonKey(name: 'Latitud')
          final num? latitude,
      @JsonKey(name: 'Longitud')
          final num? longitude}) = _$_RouteGeoData;

  factory _RouteGeoData.fromJson(Map<String, dynamic> json) =
      _$_RouteGeoData.fromJson;

  @override
  @JsonKey(name: 'AbreviaturaBanderaSMP', fromJson: _toString)
  String get routeDirection;
  @override
  @JsonKey(name: 'AbreviaturaLineaSMP', fromJson: _toString)
  String get lineAbbreviation;
  @override
  @JsonKey(name: 'IsPuntoPaso')
  bool get isCrossingPoint;
  @override
  @JsonKey(name: 'Descripcion', fromJson: _toString)
  String get description;
  @override
  @JsonKey(name: 'Latitud')
  num? get latitude;
  @override
  @JsonKey(name: 'Longitud')
  num? get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_RouteGeoDataCopyWith<_$_RouteGeoData> get copyWith =>
      throw _privateConstructorUsedError;
}
