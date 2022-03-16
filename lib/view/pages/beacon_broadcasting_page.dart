import 'package:flutter/material.dart';
import 'package:flutter_beacon_riverpod/util/constants.dart';

import 'package:flutter_beacon/flutter_beacon.dart';

class BeaconBroadcastingPage extends StatefulWidget {
  const BeaconBroadcastingPage({Key? key}) : super(key: key);

  @override
  _BeaconBroadcastingPageState createState() => _BeaconBroadcastingPageState();
}

class _BeaconBroadcastingPageState extends State<BeaconBroadcastingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Broadcast'),
      ),
      body: Container(),
    );
  }
}
