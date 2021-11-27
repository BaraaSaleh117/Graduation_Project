import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';

class BreakFastInformations extends StatefulWidget {
  const BreakFastInformations({Key? key}) : super(key: key);

  @override
  _BreakFastInformationsState createState() => _BreakFastInformationsState();
}

class _BreakFastInformationsState extends State<BreakFastInformations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
      ),
      drawer: MyDrawer(),
      body: Container(
        child: Text(
          "مكونات الوجبة",
          style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
