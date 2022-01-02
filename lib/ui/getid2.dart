import 'package:flutter/material.dart';

class getid2 extends StatefulWidget {
  late final String Id;
  getid2({required this.Id});

  @override
  _getid2State createState() => _getid2State();
}

class _getid2State extends State<getid2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          widget.Id,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
