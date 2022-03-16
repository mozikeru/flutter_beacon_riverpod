// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beacon_scanning_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BeaconScanningStateTearOff {
  const _$BeaconScanningStateTearOff();

  _BeaconScanningState call({List<Beacon> beacons = const []}) {
    return _BeaconScanningState(
      beacons: beacons,
    );
  }
}

/// @nodoc
const $BeaconScanningState = _$BeaconScanningStateTearOff();

/// @nodoc
mixin _$BeaconScanningState {
  List<Beacon> get beacons => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeaconScanningStateCopyWith<BeaconScanningState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeaconScanningStateCopyWith<$Res> {
  factory $BeaconScanningStateCopyWith(
          BeaconScanningState value, $Res Function(BeaconScanningState) then) =
      _$BeaconScanningStateCopyWithImpl<$Res>;
  $Res call({List<Beacon> beacons});
}

/// @nodoc
class _$BeaconScanningStateCopyWithImpl<$Res>
    implements $BeaconScanningStateCopyWith<$Res> {
  _$BeaconScanningStateCopyWithImpl(this._value, this._then);

  final BeaconScanningState _value;
  // ignore: unused_field
  final $Res Function(BeaconScanningState) _then;

  @override
  $Res call({
    Object? beacons = freezed,
  }) {
    return _then(_value.copyWith(
      beacons: beacons == freezed
          ? _value.beacons
          : beacons // ignore: cast_nullable_to_non_nullable
              as List<Beacon>,
    ));
  }
}

/// @nodoc
abstract class _$BeaconScanningStateCopyWith<$Res>
    implements $BeaconScanningStateCopyWith<$Res> {
  factory _$BeaconScanningStateCopyWith(_BeaconScanningState value,
          $Res Function(_BeaconScanningState) then) =
      __$BeaconScanningStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Beacon> beacons});
}

/// @nodoc
class __$BeaconScanningStateCopyWithImpl<$Res>
    extends _$BeaconScanningStateCopyWithImpl<$Res>
    implements _$BeaconScanningStateCopyWith<$Res> {
  __$BeaconScanningStateCopyWithImpl(
      _BeaconScanningState _value, $Res Function(_BeaconScanningState) _then)
      : super(_value, (v) => _then(v as _BeaconScanningState));

  @override
  _BeaconScanningState get _value => super._value as _BeaconScanningState;

  @override
  $Res call({
    Object? beacons = freezed,
  }) {
    return _then(_BeaconScanningState(
      beacons: beacons == freezed
          ? _value.beacons
          : beacons // ignore: cast_nullable_to_non_nullable
              as List<Beacon>,
    ));
  }
}

/// @nodoc

class _$_BeaconScanningState implements _BeaconScanningState {
  _$_BeaconScanningState({this.beacons = const []});

  @JsonKey()
  @override
  final List<Beacon> beacons;

  @override
  String toString() {
    return 'BeaconScanningState(beacons: $beacons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BeaconScanningState &&
            const DeepCollectionEquality().equals(other.beacons, beacons));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(beacons));

  @JsonKey(ignore: true)
  @override
  _$BeaconScanningStateCopyWith<_BeaconScanningState> get copyWith =>
      __$BeaconScanningStateCopyWithImpl<_BeaconScanningState>(
          this, _$identity);
}

abstract class _BeaconScanningState implements BeaconScanningState {
  factory _BeaconScanningState({List<Beacon> beacons}) = _$_BeaconScanningState;

  @override
  List<Beacon> get beacons;
  @override
  @JsonKey(ignore: true)
  _$BeaconScanningStateCopyWith<_BeaconScanningState> get copyWith =>
      throw _privateConstructorUsedError;
}
