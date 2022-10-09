// ignore_for_file: avoid_print

import 'package:flutter_beacon_riverpod/repository/beacon_adapter.dart';
import 'package:flutter_beacon_riverpod/state_notifier/states/beacon_scanning_state.dart';
import 'package:flutter_beacon_riverpod/state_notifier/states/bluetooth_auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'bluetooth_auth_notifier.dart';

final beaconScanningStateProvider = StateNotifierProvider.autoDispose<
    BeaconScanningNotifier, BeaconScanningState>((ref) {
  return BeaconScanningNotifier(
    ref.watch(bluetoothAuthStateProvider),
    ref.read(beaconAdapterProvider),
  );
});

class BeaconScanningNotifier extends StateNotifier<BeaconScanningState> {

  Map detectTimes = {};

  BeaconScanningNotifier(
    this._bluetoothAuthState,
    this._beaconAdapter,
  ) : super(BeaconScanningState()) {
    if (_bluetoothAuthState.authorizationStatusOk &&
        _bluetoothAuthState.locationServiceEnabled &&
        _bluetoothAuthState.bluetoothEnabled) {
      _listeningRanging(mounted);
    }
  }

  final BluetoothAuthState _bluetoothAuthState;
  final BeaconAdapterBase _beaconAdapter;

  void _listeningRanging(bool mounted) {
    _beaconAdapter.listeningRanging().listen((beacons) {
      if (beacons.isNotEmpty) {
        state = state.copyWith(beacons: beacons);
        _request(beacons);
      }
    });

    _beaconAdapter.startRanging(mounted);
  }

  void _request(List beacons) async {

    var dnow = DateTime.now();
    var phone = "�����o�[3";

    for (int i = 0; i < beacons.length; i++) {
      print(beacons[i]);

      // ���񌟒m���͎������L�^���Ȃ��Ƃ����Ȃ�
      if (!detectTimes.containsKey(beacons[i].proximityUUID)) {
        detectTimes[beacons[i].proximityUUID] = dnow;
      }
      // �v�Z�p�ɑO��L�^����������20�b���Z
      var addtime = detectTimes[beacons[i].proximityUUID].add(Duration(seconds: 20));
      // �u�O��擾����������20�b���Z���������v�����ݎ��������ߋ��������ꍇ�̂�Google�X�v���b�h�V�[�g�ɋL�^����
      if (addtime.isAfter(dnow)) {
        // �������X�L�b�v
        print("skip!!");
        continue;
      }

      print("post!!");

      var url = Uri.https("script.google.com", "macros/s/[スプレッドシートID]/exec");
      Map<String, String> headers = {'content-type': 'application/json'};

      initializeDateFormatting('ja');
      var name = "A";
      if (beacons[i].proximityUUID == 'fDA50693-A4E2-4FB1-AFCF-C6EB07647825') {
        name ="A";
      }  else if (beacons[i].proximityUUID == '90A0B14B-0BBC-4DDB-BE8C-490B296FDC26') {
        name ="B";
      }  else if (beacons[i].proximityUUID == '8BCEA556-8D61-4182-81EB-9718FF4A413D') {
        name ="C";
      }  else if (beacons[i].proximityUUID == 'E1C1DE31-B93F-4FE1-AD76-84A0984C638F') {
        name ="D";
      }  else if (beacons[i].proximityUUID == '48534442-4C45-4144-80C0-1800FFFFFFFF') {
        name ="E";
      }


      String body = jsonEncode({'phone': phone, 'name': name, 'uuid': beacons[i].proximityUUID, 'time': DateFormat('yyyy/MM/dd(E) HH:mm:ss', "ja_JP").format(dnow)});
      //String body = jsonEncode(beacons[0].proximityUUID);

      http.Response resp = await http.post(url, headers: headers, body: body);
      if (resp.statusCode != 200) {
        print(resp.statusCode);
        return;
      }

      // �����X�L�b�v���Ȃ������ꍇ�͎������L�^
      detectTimes[beacons[i].proximityUUID] = dnow;
    }
  }

}
