import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_beacon_riverpod/repository/beacon_adapter.dart';
import 'package:flutter_beacon_riverpod/state_notifier/notifiers/bluetooth_auth_notifier.dart';
import 'package:flutter_beacon_riverpod/state_notifier/states/beacon_broadcasting_state.dart';
import 'package:flutter_beacon_riverpod/state_notifier/states/bluetooth_auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final beaconBroadcastingStateProvider = StateNotifierProvider.autoDispose<
    BeaconBroadcastingNotifier, BeaconBroadcastingState>(
  (ref) => BeaconBroadcastingNotifier(
    ref.watch(bluetoothAuthStateProvider),
    ref.read(beaconAdapterProvider),
  ),
);

class BeaconBroadcastingNotifier
    extends StateNotifier<BeaconBroadcastingState> {
  BeaconBroadcastingNotifier(
    this._bluetoothAuthState,
    this._beaconAdapter,
  ) : super(
          BeaconBroadcastingState(
            broadcastReady: _bluetoothAuthState.authorizationStatusOk &&
                _bluetoothAuthState.locationServiceEnabled &&
                _bluetoothAuthState.bluetoothEnabled,
          ),
        );

  final BluetoothAuthState _bluetoothAuthState;
  final BeaconAdapterBase _beaconAdapter;

  bool get broadcastReady =>
      _bluetoothAuthState.authorizationStatusOk &&
      _bluetoothAuthState.locationServiceEnabled &&
      _bluetoothAuthState.bluetoothEnabled;

  Future<void> toggleBroadcasting(
    String proximityUUID,
    int major,
    int minor,
  ) async {
    if (state.isBroadcasting) {
      await _beaconAdapter.stopBroadcast();
    } else {
      await _beaconAdapter.startBroadcast(
        BeaconBroadcast(
          proximityUUID: proximityUUID,
          major: major,
          minor: minor,
        ),
      );
    }

    final isBroadcasting = await _beaconAdapter.isBroadcasting();
    state = state.copyWith(isBroadcasting: isBroadcasting);
  }
}
