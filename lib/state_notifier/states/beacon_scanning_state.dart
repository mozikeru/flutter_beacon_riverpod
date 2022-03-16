import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beacon_scanning_state.freezed.dart';
// part 'beacon_monitor_state.g.dart';

@freezed
class BeaconScanningState with _$BeaconScanningState {
  factory BeaconScanningState({
    @Default([]) List<Beacon> beacons,
  }) = _BeaconScanningState;

  // factory BeaconScanState.fromJson(Map<String, dynamic> json) =>
  //     _$BeaconScanStateFromJson(json);
}