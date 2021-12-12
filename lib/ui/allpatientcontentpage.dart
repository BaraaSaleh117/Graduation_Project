import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/ui/diabetesregulation.dart';
import 'package:graduation_projectflutter/ui/doctorlogin.dart';
import 'package:graduation_projectflutter/ui/patientlogin.dart';
import 'package:graduation_projectflutter/ui/patientsregister.dart';
import 'package:graduation_projectflutter/ui/patientui.dart';
import 'package:graduation_projectflutter/ui/physicalactivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllPatientContentPage extends StatefulWidget {
  const AllPatientContentPage({Key? key}) : super(key: key);

  @override
  _AllPatientContentPage createState() => _AllPatientContentPage();
}

class _AllPatientContentPage extends State<AllPatientContentPage> {
  var country;
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
            PatientUi(),
            DiabetesReg(),
            PhysicalActivity(),
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
                  Icons.favorite_border_outlined,
                  size: 30,
                ),
                label: 'Measurements'),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("lib/assets/blood-test.png"),
                size: 30,
              ),
              label: 'Health condition',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.fitness_center,
                  size: 30,
                ),
                label: 'Physical Activity'),
          ],
        ),
      ),
    );
  }

  void _bottomTapped(int index) => setState(() => _currentIndex = index);
}
