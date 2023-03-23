// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_map_options_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RouteMapState {
  bool? get showAllStops => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouteMapStateCopyWith<RouteMapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteMapStateCopyWith<$Res> {
  factory $RouteMapStateCopyWith(
          RouteMapState value, $Res Function(RouteMapState) then) =
      _$RouteMapStateCopyWithImpl<$Res, RouteMapState>;
  @useResult
  $Res call({bool? showAllStops});
}

/// @nodoc
class _$RouteMapStateCopyWithImpl<$Res, $Val extends RouteMapState>
    implements $RouteMapStateCopyWith<$Res> {
  _$RouteMapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showAllStops = freezed,
  }) {
    return _then(_value.copyWith(
      showAllStops: freezed == showAllStops
          ? _value.showAllStops
          : showAllStops // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RouteMapStateCopyWith<$Res>
    implements $RouteMapStateCopyWith<$Res> {
  factory _$$_RouteMapStateCopyWith(
          _$_RouteMapState value, $Res Function(_$_RouteMapState) then) =
      __$$_RouteMapStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? showAllStops});
}

/// @nodoc
class __$$_RouteMapStateCopyWithImpl<$Res>
    extends _$RouteMapStateCopyWithImpl<$Res, _$_RouteMapState>
    implements _$$_RouteMapStateCopyWith<$Res> {
  __$$_RouteMapStateCopyWithImpl(
      _$_RouteMapState _value, $Res Function(_$_RouteMapState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showAllStops = freezed,
  }) {
    return _then(_$_RouteMapState(
      showAllStops: freezed == showAllStops
          ? _value.showAllStops
          : showAllStops // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_RouteMapState implements _RouteMapState {
  const _$_RouteMapState({this.showAllStops = false});

  @override
  @JsonKey()
  final bool? showAllStops;

  @override
  String toString() {
    return 'RouteMapState(showAllStops: $showAllStops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RouteMapState &&
            (identical(other.showAllStops, showAllStops) ||
                other.showAllStops == showAllStops));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showAllStops);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RouteMapStateCopyWith<_$_RouteMapState> get copyWith =>
      __$$_RouteMapStateCopyWithImpl<_$_RouteMapState>(this, _$identity);
}

abstract class _RouteMapState implements RouteMapState {
  const factory _RouteMapState({final bool? showAllStops}) = _$_RouteMapState;

  @override
  bool? get showAllStops;
  @override
  @JsonKey(ignore: true)
  _$$_RouteMapStateCopyWith<_$_RouteMapState> get copyWith =>
      throw _privateConstructorUsedError;
}
