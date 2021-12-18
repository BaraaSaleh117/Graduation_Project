import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/ui/DoctorUi/doctorui.dart';
import 'package:graduation_projectflutter/ui/DoctorUi/homedoctorr.dart';
import 'package:graduation_projectflutter/ui/diabetesregulation.dart';
import 'package:graduation_projectflutter/ui/doctorlogin.dart';
import 'package:graduation_projectflutter/ui/patientlogin.dart';
import 'package:graduation_projectflutter/ui/patientsregister.dart';
import 'package:graduation_projectflutter/ui/patientui.dart';
import 'package:graduation_projectflutter/ui/physicalactivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class docHomePage extends StatefulWidget {
  const docHomePage({Key? key}) : super(key: key);

  @override
  _docHomePage createState() => _docHomePage();
}

class _docHomePage extends State<docHomePage> {
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            HomeDoc(),
            DoctorUi(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: _bottomTapped,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black54,
          selectedFontSize: 18,
          unselectedFontSize: 13,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              label: 'Patients List',
            ),
          ],
        ),
      ),
    );
  }

  void _bottomTapped(int index) => setState(() => _currentIndex = index);
}
