// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_beacon_riverpod/util/constants.dart';

class BeaconBroadcastingPage extends StatefulWidget {
  const BeaconBroadcastingPage({Key? key}) : super(key: key);

  @override
  _BeaconBroadcastingPageState createState() => _BeaconBroadcastingPageState();
}

class _BeaconBroadcastingPageState extends State<BeaconBroadcastingPage>
    with WidgetsBindingObserver {
  final clearFocus = FocusNode();
  bool authorizationStatusOk = false;
  bool locationServiceEnabled = false;
  bool bluetoothEnabled = false;
  bool broadcasting = false;

  final regexUUID = RegExp(
      r'[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}');
  final uuidController = TextEditingController(text: kProximityUUID);
  final majorController = TextEditingController(text: '0');
  final minorController = TextEditingController(text: '0');

  bool get broadcastReady =>
      authorizationStatusOk == true &&
      locationServiceEnabled == true &&
      bluetoothEnabled == true;

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();

    checkAllRequirements();
  }

  ///
  /// 権限チェック
  ///
  checkAllRequirements() async {
    final bluetoothState = await flutterBeacon.bluetoothState;
    final bluetoothEnabled = bluetoothState == BluetoothState.stateOn;
    final authorizationStatus = await flutterBeacon.authorizationStatus;
    final authorizationStatusOk =
        authorizationStatus == AuthorizationStatus.allowed ||
            authorizationStatus == AuthorizationStatus.whenInUse ||
            authorizationStatus == AuthorizationStatus.always;
    final locationServiceEnabled =
        await flutterBeacon.checkLocationServicesIfEnabled;

    print('broadcast: authorizationStatusOk=$authorizationStatusOk, '
        'locationServiceEnabled=$locationServiceEnabled, '
        'bluetoothEnabled=$bluetoothEnabled');

    setState(() {
      this.authorizationStatusOk = authorizationStatusOk;
      this.locationServiceEnabled = locationServiceEnabled;
      this.bluetoothEnabled = bluetoothEnabled;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print('AppLifecycleState = $state');
    if (state == AppLifecycleState.resumed) {
      await checkAllRequirements();
    } else if (state == AppLifecycleState.paused) {}
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    flutterBeacon.close;

    clearFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Broadcast'),
        centerTitle: false,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(clearFocus),
        child: broadcastReady != true
            ? const Center(child: Text('Please wait...'))
            : Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      uuidField,
                      majorField,
                      minorField,
                      const SizedBox(height: 16),
                      buttonBroadcast,
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget get uuidField {
    return TextFormField(
      readOnly: broadcasting,
      controller: uuidController,
      decoration: const InputDecoration(
        labelText: 'Proximity UUID',
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Proximity UUID required';
        }

        if (!regexUUID.hasMatch(val)) {
          return 'Invalid Proxmity UUID format';
        }

        return null;
      },
    );
  }

  Widget get majorField {
    return TextFormField(
      readOnly: broadcasting,
      controller: majorController,
      decoration: const InputDecoration(
        labelText: 'Major',
      ),
      keyboardType: TextInputType.number,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Major required';
        }

        try {
          int major = int.parse(val);

          if (major < 0 || major > 65535) {
            return 'Major must be number between 0 and 65535';
          }
        } on FormatException {
          return 'Major must be number';
        }

        return null;
      },
    );
  }

  Widget get minorField {
    return TextFormField(
      readOnly: broadcasting,
      controller: minorController,
      decoration: const InputDecoration(
        labelText: 'Minor',
      ),
      keyboardType: TextInputType.number,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Minor required';
        }

        try {
          int minor = int.parse(val);

          if (minor < 0 || minor > 65535) {
            return 'Minor must be number between 0 and 65535';
          }
        } on FormatException {
          return 'Minor must be number';
        }

        return null;
      },
    );
  }

  Widget get buttonBroadcast {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: broadcasting ? Colors.red : Theme.of(context).primaryColor,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: () async {
        if (broadcasting) {
          await flutterBeacon.stopBroadcast();
        } else {
          await flutterBeacon.startBroadcast(BeaconBroadcast(
            proximityUUID: uuidController.text,
            major: int.tryParse(majorController.text) ?? 0,
            minor: int.tryParse(minorController.text) ?? 0,
          ));
        }

        final isBroadcasting = await flutterBeacon.isBroadcasting();

        if (mounted) {
          setState(() {
            broadcasting = isBroadcasting;
          });
        }
      },
      child: Text('Broadcast${broadcasting ? 'ing' : ''}'),
    );
  }
}
