import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/ui/doctorlogin.dart';
import 'package:graduation_projectflutter/ui/patientlogin.dart';
import 'package:graduation_projectflutter/ui/patientsregister.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var country;
  var _currentIndex = 0;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    country = preferences.getString("country");
    print(country);
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            PatientLogin(),
            DoctorLogin(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white70,
          currentIndex: _currentIndex,
          onTap: _bottomTapped,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black38,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Patient'),
            BottomNavigationBarItem(
              icon: Icon(Icons.personal_injury_rounded),
              label: 'Doctor',
            ),
          ],
        ),
      ),
    );
  }

  void _bottomTapped(int index) => setState(() => _currentIndex = index);
}
