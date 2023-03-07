// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routes_by_arrival_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoutesByArrival _$RoutesByArrivalFromJson(Map<String, dynamic> json) {
  return _RoutesByArrival.fromJson(json);
}

/// @nodoc
mixin _$RoutesByArrival {
  @JsonKey(name: 'CodigoEstado', fromJson: _toString)
  String get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'MensajeEstado')
  String get statusMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'lineas')
  List<Route> get routes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoutesByArrivalCopyWith<RoutesByArrival> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutesByArrivalCopyWith<$Res> {
  factory $RoutesByArrivalCopyWith(
          RoutesByArrival value, $Res Function(RoutesByArrival) then) =
      _$RoutesByArrivalCopyWithImpl<$Res, RoutesByArrival>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString) String statusCode,
      @JsonKey(name: 'MensajeEstado') String statusMessage,
      @JsonKey(name: 'lineas') List<Route> routes});
}

/// @nodoc
class _$RoutesByArrivalCopyWithImpl<$Res, $Val extends RoutesByArrival>
    implements $RoutesByArrivalCopyWith<$Res> {
  _$RoutesByArrivalCopyWithImpl(this._value, this._then);

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
              as List<Route>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoutesByArrivalCopyWith<$Res>
    implements $RoutesByArrivalCopyWith<$Res> {
  factory _$$_RoutesByArrivalCopyWith(
          _$_RoutesByArrival value, $Res Function(_$_RoutesByArrival) then) =
      __$$_RoutesByArrivalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString) String statusCode,
      @JsonKey(name: 'MensajeEstado') String statusMessage,
      @JsonKey(name: 'lineas') List<Route> routes});
}

/// @nodoc
class __$$_RoutesByArrivalCopyWithImpl<$Res>
    extends _$RoutesByArrivalCopyWithImpl<$Res, _$_RoutesByArrival>
    implements _$$_RoutesByArrivalCopyWith<$Res> {
  __$$_RoutesByArrivalCopyWithImpl(
      _$_RoutesByArrival _value, $Res Function(_$_RoutesByArrival) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? routes = null,
  }) {
    return _then(_$_RoutesByArrival(
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
              as List<Route>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoutesByArrival
    with DiagnosticableTreeMixin
    implements _RoutesByArrival {
  const _$_RoutesByArrival(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString)
          required this.statusCode,
      @JsonKey(name: 'MensajeEstado')
          required this.statusMessage,
      @JsonKey(name: 'lineas')
          required final List<Route> routes})
      : _routes = routes;

  factory _$_RoutesByArrival.fromJson(Map<String, dynamic> json) =>
      _$$_RoutesByArrivalFromJson(json);

  @override
  @JsonKey(name: 'CodigoEstado', fromJson: _toString)
  final String statusCode;
  @override
  @JsonKey(name: 'MensajeEstado')
  final String statusMessage;
  final List<Route> _routes;
  @override
  @JsonKey(name: 'lineas')
  List<Route> get routes {
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routes);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoutesByArrival(statusCode: $statusCode, statusMessage: $statusMessage, routes: $routes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoutesByArrival'))
      ..add(DiagnosticsProperty('statusCode', statusCode))
      ..add(DiagnosticsProperty('statusMessage', statusMessage))
      ..add(DiagnosticsProperty('routes', routes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoutesByArrival &&
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
  _$$_RoutesByArrivalCopyWith<_$_RoutesByArrival> get copyWith =>
      __$$_RoutesByArrivalCopyWithImpl<_$_RoutesByArrival>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoutesByArrivalToJson(
      this,
    );
  }
}

abstract class _RoutesByArrival implements RoutesByArrival {
  const factory _RoutesByArrival(
      {@JsonKey(name: 'CodigoEstado', fromJson: _toString)
          required final String statusCode,
      @JsonKey(name: 'MensajeEstado')
          required final String statusMessage,
      @JsonKey(name: 'lineas')
          required final List<Route> routes}) = _$_RoutesByArrival;

  factory _RoutesByArrival.fromJson(Map<String, dynamic> json) =
      _$_RoutesByArrival.fromJson;

  @override
  @JsonKey(name: 'CodigoEstado', fromJson: _toString)
  String get statusCode;
  @override
  @JsonKey(name: 'MensajeEstado')
  String get statusMessage;
  @override
  @JsonKey(name: 'lineas')
  List<Route> get routes;
  @override
  @JsonKey(ignore: true)
  _$$_RoutesByArrivalCopyWith<_$_RoutesByArrival> get copyWith =>
      throw _privateConstructorUsedError;
}

Route _$RouteFromJson(Map<String, dynamic> json) {
  return _Route.fromJson(json);
}

/// @nodoc
mixin _$Route {
  @JsonKey(name: 'CodigoLineaParada', fromJson: _toString)
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Descripcion', fromJson: _toString)
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'CodigoEntidad', fromJson: _toString)
  String get entityCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'CodigoEmpresa', fromJson: _toString)
  String get companyCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteCopyWith<Route> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteCopyWith<$Res> {
  factory $RouteCopyWith(Route value, $Res Function(Route) then) =
      _$RouteCopyWithImpl<$Res, Route>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CodigoLineaParada', fromJson: _toString) String code,
      @JsonKey(name: 'Descripcion', fromJson: _toString) String description,
      @JsonKey(name: 'CodigoEntidad', fromJson: _toString) String entityCode,
      @JsonKey(name: 'CodigoEmpresa', fromJson: _toString) String companyCode});
}

/// @nodoc
class _$RouteCopyWithImpl<$Res, $Val extends Route>
    implements $RouteCopyWith<$Res> {
  _$RouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
    Object? entityCode = null,
    Object? companyCode = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      entityCode: null == entityCode
          ? _value.entityCode
          : entityCode // ignore: cast_nullable_to_non_nullable
              as String,
      companyCode: null == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RouteCopyWith<$Res> implements $RouteCopyWith<$Res> {
  factory _$$_RouteCopyWith(_$_Route value, $Res Function(_$_Route) then) =
      __$$_RouteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CodigoLineaParada', fromJson: _toString) String code,
      @JsonKey(name: 'Descripcion', fromJson: _toString) String description,
      @JsonKey(name: 'CodigoEntidad', fromJson: _toString) String entityCode,
      @JsonKey(name: 'CodigoEmpresa', fromJson: _toString) String companyCode});
}

/// @nodoc
class __$$_RouteCopyWithImpl<$Res> extends _$RouteCopyWithImpl<$Res, _$_Route>
    implements _$$_RouteCopyWith<$Res> {
  __$$_RouteCopyWithImpl(_$_Route _value, $Res Function(_$_Route) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
    Object? entityCode = null,
    Object? companyCode = null,
  }) {
    return _then(_$_Route(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      entityCode: null == entityCode
          ? _value.entityCode
          : entityCode // ignore: cast_nullable_to_non_nullable
              as String,
      companyCode: null == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Route with DiagnosticableTreeMixin implements _Route {
  const _$_Route(
      {@JsonKey(name: 'CodigoLineaParada', fromJson: _toString)
          required this.code,
      @JsonKey(name: 'Descripcion', fromJson: _toString)
          required this.description,
      @JsonKey(name: 'CodigoEntidad', fromJson: _toString)
          required this.entityCode,
      @JsonKey(name: 'CodigoEmpresa', fromJson: _toString)
          required this.companyCode});

  factory _$_Route.fromJson(Map<String, dynamic> json) =>
      _$$_RouteFromJson(json);

  @override
  @JsonKey(name: 'CodigoLineaParada', fromJson: _toString)
  final String code;
  @override
  @JsonKey(name: 'Descripcion', fromJson: _toString)
  final String description;
  @override
  @JsonKey(name: 'CodigoEntidad', fromJson: _toString)
  final String entityCode;
  @override
  @JsonKey(name: 'CodigoEmpresa', fromJson: _toString)
  final String companyCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Route(code: $code, description: $description, entityCode: $entityCode, companyCode: $companyCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Route'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('entityCode', entityCode))
      ..add(DiagnosticsProperty('companyCode', companyCode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Route &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.entityCode, entityCode) ||
                other.entityCode == entityCode) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, description, entityCode, companyCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RouteCopyWith<_$_Route> get copyWith =>
      __$$_RouteCopyWithImpl<_$_Route>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RouteToJson(
      this,
    );
  }
}

abstract class _Route implements Route {
  const factory _Route(
      {@JsonKey(name: 'CodigoLineaParada', fromJson: _toString)
          required final String code,
      @JsonKey(name: 'Descripcion', fromJson: _toString)
          required final String description,
      @JsonKey(name: 'CodigoEntidad', fromJson: _toString)
          required final String entityCode,
      @JsonKey(name: 'CodigoEmpresa', fromJson: _toString)
          required final String companyCode}) = _$_Route;

  factory _Route.fromJson(Map<String, dynamic> json) = _$_Route.fromJson;

  @override
  @JsonKey(name: 'CodigoLineaParada', fromJson: _toString)
  String get code;
  @override
  @JsonKey(name: 'Descripcion', fromJson: _toString)
  String get description;
  @override
  @JsonKey(name: 'CodigoEntidad', fromJson: _toString)
  String get entityCode;
  @override
  @JsonKey(name: 'CodigoEmpresa', fromJson: _toString)
  String get companyCode;
  @override
  @JsonKey(ignore: true)
  _$$_RouteCopyWith<_$_Route> get copyWith =>
      throw _privateConstructorUsedError;
}
