import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_beacon_riverpod/repository/beacon_adapter.dart';
import 'package:flutter_beacon_riverpod/state_notifier/notifiers/beacon_scanning_notifier.dart';
import 'package:flutter_beacon_riverpod/state_notifier/notifiers/bluetooth_auth_notifier.dart';
import 'package:flutter_beacon_riverpod/state_notifier/states/beacon_scanning_state.dart';
import 'package:flutter_beacon_riverpod/util/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../dummy/dummy_data.dart';
import '../../repository/fake_beacon_adapter.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer(
      overrides: [
        beaconAdapterProvider.overrideWithValue(FakeBeaconAdapter()),
      ],
    );
  });
  group('BeaconScanningNotifier Test', () {
    test('レンジング監視により、ダミーのビーコンを検出し、stateを更新できること', () async {
      /// Providerの参照を破棄しないための処置
      /// 参考:https://zenn.dev/omtians9425/articles/4a74f982788bdb
      final beaconScanningState = container
          .listen(beaconScanningStateProvider, (previous, next) {})
          .read();

      expect(beaconScanningState, BeaconScanningState());

      final bluetoothAuthNotifier =
          container.read(bluetoothAuthStateProvider.notifier);

      await bluetoothAuthNotifier.openLocationSettings();
      await bluetoothAuthNotifier.requestLocationAuthorization();
      await bluetoothAuthNotifier.openBluetoothSettings();
      // レンジング監視実行していないので、ビーコン情報は空(1)
      expect(container.read(beaconScanningStateProvider).beacons, []);

      // ここでbluetoothAuthStateProviderをref.watchしているbeaconScanningStateProviderが
      // 更新され、_listeningRangingが実行される(2)
      await bluetoothAuthNotifier.initScanBeacon();
      // 適当な時間を設けてメソッド内のlisten以下の処理が実行されるようwaitをしている(4)
      await Future.delayed(const Duration(seconds: 3));
      // ダミーのアドバタイズ信号にて更新(3)
      expect(container.read(beaconScanningStateProvider).beacons, [
        const Beacon(
          proximityUUID: kProximityUUID,
          major: kDummyBeaconMajor,
          minor: kDummyBeaconMinor,
          accuracy: kDummyAccuracy,
        ),
      ]);
    });
  });
}
