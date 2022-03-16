// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bluetooth_auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BluetoothAuthStateTearOff {
  const _$BluetoothAuthStateTearOff();

  _BluetoothAuthState call(
      {bool authorizationStatusOk = false,
      bool locationServiceEnabled = false,
      bool bluetoothEnabled = false}) {
    return _BluetoothAuthState(
      authorizationStatusOk: authorizationStatusOk,
      locationServiceEnabled: locationServiceEnabled,
      bluetoothEnabled: bluetoothEnabled,
    );
  }
}

/// @nodoc
const $BluetoothAuthState = _$BluetoothAuthStateTearOff();

/// @nodoc
mixin _$BluetoothAuthState {
// 認証ステータス
  bool get authorizationStatusOk => throw _privateConstructorUsedError; // (3)
// 位置情報認証許可
  bool get locationServiceEnabled =>
      throw _privateConstructorUsedError; // Bluetooth認証許可
  bool get bluetoothEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothAuthStateCopyWith<BluetoothAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothAuthStateCopyWith<$Res> {
  factory $BluetoothAuthStateCopyWith(
          BluetoothAuthState value, $Res Function(BluetoothAuthState) then) =
      _$BluetoothAuthStateCopyWithImpl<$Res>;
  $Res call(
      {bool authorizationStatusOk,
      bool locationServiceEnabled,
      bool bluetoothEnabled});
}

/// @nodoc
class _$BluetoothAuthStateCopyWithImpl<$Res>
    implements $BluetoothAuthStateCopyWith<$Res> {
  _$BluetoothAuthStateCopyWithImpl(this._value, this._then);

  final BluetoothAuthState _value;
  // ignore: unused_field
  final $Res Function(BluetoothAuthState) _then;

  @override
  $Res call({
    Object? authorizationStatusOk = freezed,
    Object? locationServiceEnabled = freezed,
    Object? bluetoothEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      authorizationStatusOk: authorizationStatusOk == freezed
          ? _value.authorizationStatusOk
          : authorizationStatusOk // ignore: cast_nullable_to_non_nullable
              as bool,
      locationServiceEnabled: locationServiceEnabled == freezed
          ? _value.locationServiceEnabled
          : locationServiceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      bluetoothEnabled: bluetoothEnabled == freezed
          ? _value.bluetoothEnabled
          : bluetoothEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$BluetoothAuthStateCopyWith<$Res>
    implements $BluetoothAuthStateCopyWith<$Res> {
  factory _$BluetoothAuthStateCopyWith(
          _BluetoothAuthState value, $Res Function(_BluetoothAuthState) then) =
      __$BluetoothAuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool authorizationStatusOk,
      bool locationServiceEnabled,
      bool bluetoothEnabled});
}

/// @nodoc
class __$BluetoothAuthStateCopyWithImpl<$Res>
    extends _$BluetoothAuthStateCopyWithImpl<$Res>
    implements _$BluetoothAuthStateCopyWith<$Res> {
  __$BluetoothAuthStateCopyWithImpl(
      _BluetoothAuthState _value, $Res Function(_BluetoothAuthState) _then)
      : super(_value, (v) => _then(v as _BluetoothAuthState));

  @override
  _BluetoothAuthState get _value => super._value as _BluetoothAuthState;

  @override
  $Res call({
    Object? authorizationStatusOk = freezed,
    Object? locationServiceEnabled = freezed,
    Object? bluetoothEnabled = freezed,
  }) {
    return _then(_BluetoothAuthState(
      authorizationStatusOk: authorizationStatusOk == freezed
          ? _value.authorizationStatusOk
          : authorizationStatusOk // ignore: cast_nullable_to_non_nullable
              as bool,
      locationServiceEnabled: locationServiceEnabled == freezed
          ? _value.locationServiceEnabled
          : locationServiceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      bluetoothEnabled: bluetoothEnabled == freezed
          ? _value.bluetoothEnabled
          : bluetoothEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BluetoothAuthState implements _BluetoothAuthState {
  _$_BluetoothAuthState(
      {this.authorizationStatusOk = false,
      this.locationServiceEnabled = false,
      this.bluetoothEnabled = false});

  @JsonKey()
  @override // 認証ステータス
  final bool authorizationStatusOk;
  @JsonKey()
  @override // (3)
// 位置情報認証許可
  final bool locationServiceEnabled;
  @JsonKey()
  @override // Bluetooth認証許可
  final bool bluetoothEnabled;

  @override
  String toString() {
    return 'BluetoothAuthState(authorizationStatusOk: $authorizationStatusOk, locationServiceEnabled: $locationServiceEnabled, bluetoothEnabled: $bluetoothEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BluetoothAuthState &&
            const DeepCollectionEquality()
                .equals(other.authorizationStatusOk, authorizationStatusOk) &&
            const DeepCollectionEquality()
                .equals(other.locationServiceEnabled, locationServiceEnabled) &&
            const DeepCollectionEquality()
                .equals(other.bluetoothEnabled, bluetoothEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(authorizationStatusOk),
      const DeepCollectionEquality().hash(locationServiceEnabled),
      const DeepCollectionEquality().hash(bluetoothEnabled));

  @JsonKey(ignore: true)
  @override
  _$BluetoothAuthStateCopyWith<_BluetoothAuthState> get copyWith =>
      __$BluetoothAuthStateCopyWithImpl<_BluetoothAuthState>(this, _$identity);
}

abstract class _BluetoothAuthState implements BluetoothAuthState {
  factory _BluetoothAuthState(
      {bool authorizationStatusOk,
      bool locationServiceEnabled,
      bool bluetoothEnabled}) = _$_BluetoothAuthState;

  @override // 認証ステータス
  bool get authorizationStatusOk;
  @override // (3)
// 位置情報認証許可
  bool get locationServiceEnabled;
  @override // Bluetooth認証許可
  bool get bluetoothEnabled;
  @override
  @JsonKey(ignore: true)
  _$BluetoothAuthStateCopyWith<_BluetoothAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
