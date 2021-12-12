import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhysicalActivity extends StatefulWidget {
  const PhysicalActivity({Key? key}) : super(key: key);

  @override
  _PhysicalActivityState createState() => _PhysicalActivityState();
}

class _PhysicalActivityState extends State<PhysicalActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white12,
        ),
        body: Container(
          color: Colors.grey,
          child: Text(
            "Physical Activity Page",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade500),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
