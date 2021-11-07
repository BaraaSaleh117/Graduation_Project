import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/scale/raw_data_pane.dart';
import 'package:graduation_projectflutter/scale/scanning_pane.dart';

class ScaleApp extends StatefulWidget {
  @override
  _ScaleAppState createState() => _ScaleAppState();
}

class _ScaleAppState extends State<ScaleApp> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Connect with the smart scale'),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            ScanningPane(),
            RawDataPane(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _bottomTapped,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black26,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.bluetooth),
              label: 'Connect Bluetooth ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.date_range_sharp),
              label: 'Get Weight',
            ),
          ],
        ),
      ),
    );
  }

  void _bottomTapped(int index) => setState(() => _currentIndex = index);
}
