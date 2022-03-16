import 'dart:async';
import 'dart:core';
import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_beacon_riverpod/state_notifier/states/bluetooth_auth_state.dart';
import 'package:flutter_beacon_riverpod/util/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BeaconAdapterBase {
  StreamController<List<Beacon>>? streamBeaconRangingController;

  ///
  /// 位置情報の権限許可リクエスト
  ///
  Future requestLocationAuthorization();

  ///
  /// 端末位置情報 ON
  ///
  Future openLocationSettings();

  ///
  /// 端末Bluetooth ON
  ///
  Future openBluetoothSettings();

  ///
  /// Bluetooth ON/OFF状態の検知
  ///
  Stream<BluetoothState> listeningBluetoothState();

  ///
  /// ビーコン初期化
  ///
  Future initializeScanning();

  ///
  /// 権限取得
  ///
  Future<BluetoothAuthState> getAllRequirements();

  ///
  /// レンジングによる監視
  ///
  void listeningRanging(bool mounted);

  ///
  /// ビーコンスキャン停止
  ///
  Future pauseScanBeacon();

  ///
  /// キャンセル(破棄)処理
  ///
  Future cancel();

  ///
  /// 発信開始
  ///
  Future stopBroadcast();

  ///
  /// 発信停止
  ///
  Future startBroadcast(BeaconBroadcast beaconBroadcast);

  ///
  /// 発信中チェック
  ///
  Future<bool> isBroadcasting();
}

final beaconAdapterProvider = Provider.autoDispose<BeaconAdapterBase>((ref) {
  return BeaconAdapter();
});

class BeaconAdapter implements BeaconAdapterBase {
  BeaconAdapter();

  @override
  StreamController<List<Beacon>>? streamBeaconRangingController;

  @override
  Future cancel() {
    // TODO: implement cancel
    throw UnimplementedError();
  }

  @override
  Future<BluetoothAuthState> getAllRequirements() {
    // TODO: implement getAllRequirements
    throw UnimplementedError();
  }

  @override
  Future initializeScanning() {
    // TODO: implement initializeScanning
    throw UnimplementedError();
  }

  @override
  Future<bool> isBroadcasting() {
    // TODO: implement isBroadcasting
    throw UnimplementedError();
  }

  @override
  Stream<BluetoothState> listeningBluetoothState() {
    // TODO: implement listeningBluetoothState
    throw UnimplementedError();
  }

  @override
  void listeningRanging(bool mounted) {
    // TODO: implement listeningRanging
  }

  @override
  Future openBluetoothSettings() {
    // TODO: implement openBluetoothSettings
    throw UnimplementedError();
  }

  @override
  Future openLocationSettings() {
    // TODO: implement openLocationSettings
    throw UnimplementedError();
  }

  @override
  Future pauseScanBeacon() {
    // TODO: implement pauseScanBeacon
    throw UnimplementedError();
  }

  @override
  Future requestLocationAuthorization() {
    // TODO: implement requestLocationAuthorization
    throw UnimplementedError();
  }

  @override
  Future startBroadcast(BeaconBroadcast beaconBroadcast) {
    // TODO: implement startBroadcast
    throw UnimplementedError();
  }

  @override
  Future stopBroadcast() {
    // TODO: implement stopBroadcast
    throw UnimplementedError();
  }
}
