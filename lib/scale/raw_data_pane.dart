import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/util/permissions.dart';
import 'package:xiaomi_scale/src/mi_scale.dart';
import 'package:xiaomi_scale/src/model/mi_scale_data.dart';

class RawDataPane extends StatefulWidget {
  @override
  _RawDataPaneState createState() => _RawDataPaneState();
}

class _RawDataPaneState extends State<RawDataPane> {
  StreamSubscription? _dataSubscription;
  List<MiScaleData> scaleData = [];
  final _scale = MiScale.instance;

  @override
  void dispose() {
    super.dispose();
    stopTakingData(dispose: true);
  }

  String getweight() {
    String weight = scaleData[0].weight.toString();

    print("your weight is ");
    return weight;
  }

  void getUnit() {
    String unit = scaleData[0].unit.toString();

    print(unit);
  }

  String Date() {
    String Date = scaleData[0].dateTime.toString();
    String d = Date.toUpperCase();
    return d;
  }

  Future<void> startTakingData() async {
    // Make sure we have location permission required for BLE scanning
    if (!await checkPermission()) return;
    // Start taking measurements
    setState(() {
      _dataSubscription = _scale.readScaleData().listen(
        (data) {
          setState(() {
            scaleData.insert(0, data);
            if (scaleData.length > 1) scaleData.removeLast();
          });
        },
        onError: (e) {
          print(e);
          stopTakingData();
        },
        onDone: stopTakingData,
      );
    });
  }

  void stopTakingData({dispose = false}) {
    _dataSubscription?.cancel();
    _dataSubscription = null;
    if (!dispose) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Start Reading'),
              onPressed: _dataSubscription == null ? startTakingData : null,
            ),
            ElevatedButton(
                child: const Text('Get Data'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.teal,
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Text("your Weight is " +
                            getweight() +
                            " Kg " +
                            "\n" +
                            "\n" +
                            "last weighing in : " +
                            Date()),
                      );
                    },
                  );
                }),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(''),
                ...scaleData.map(_buildScaleDataWidget),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildScaleDataWidget(MiScaleData data) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/b.png"), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(data.toString()),
      ),
    );
  }
}