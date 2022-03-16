import 'package:freezed_annotation/freezed_annotation.dart';

part 'beacon_broadcasting_state.freezed.dart';
// part 'beacon_monitor_state.g.dart';

@freezed
class BeaconBroadcastingState with _$BeaconBroadcastingState {
  factory BeaconBroadcastingState({
    @Default(false) bool broadcastReady,
    @Default(false) bool isBroadcasting,
  }) = _BeaconBroadcastingState;

  // factory BeaconScanState.fromJson(Map<String, dynamic> json) =>
  //     _$BeaconScanStateFromJson(json);
}
