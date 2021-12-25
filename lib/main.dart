import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/home.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_home_screen.dart';
import 'package:graduation_projectflutter/models/resolution.dart';
import 'package:graduation_projectflutter/patientPage/my_diary/my_diary_screen.dart';
import 'package:graduation_projectflutter/patientPage/training/training_screen.dart';
import 'package:graduation_projectflutter/ui/DoctorUi/doctorhome.dart';
import 'package:graduation_projectflutter/ui/DoctorUi/doctorui.dart';
import 'package:graduation_projectflutter/ui/allpatientcontentpage.dart';
import 'package:graduation_projectflutter/ui/background.dart';

import 'package:graduation_projectflutter/ui/choosecountry.dart';
import 'package:graduation_projectflutter/ui/connectwithscale.dart';
import 'package:graduation_projectflutter/ui/detcalview.dart';
import 'package:graduation_projectflutter/ui/diabetesregulation.dart';
import 'package:graduation_projectflutter/ui/foodlistschosen.dart';
import 'package:graduation_projectflutter/ui/line.dart';
import 'package:graduation_projectflutter/ui/mealsui/breakfast.dart';
import 'package:graduation_projectflutter/ui/mealsui/details.dart';
import 'package:graduation_projectflutter/ui/mealsui/breakfastlistview.dart';
import 'package:graduation_projectflutter/ui/mealsui/dinner.dart';
import 'package:graduation_projectflutter/ui/mealsui/lunch.dart';
import 'package:graduation_projectflutter/ui/mealsui/mealst.dart';
import 'package:graduation_projectflutter/ui/mealsui/snack.dart';
import 'package:graduation_projectflutter/ui/patientUi.dart';
import 'package:graduation_projectflutter/ui/patientlogin.dart';
import 'package:graduation_projectflutter/ui/questions.dart';
import 'package:http/http.dart' as http;
import 'fetch_api/fetchapi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: Home(),
      routes: {
        "PatientsUi": (context) {
          return PatientUi();
        },
        "BreakFast": (context) {
          return BreakFastss();
        },
        "Lunch": (context) {
          return Lunch();
        },
        "Snacks": (context) {
          return Snacks();
        },
        "Dinner": (context) {
          return Dinner();
        },
      },
      /*Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: FutureBuilder(
          future: fetchApi.getPatientResolution(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<PatientResolution> snap = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error Fetching Data"),
              );
            }
            return ListView.builder(
              itemCount: snap.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 4.0,
                  child: ListTile(
                    title: ListTile(
                      title: Text(snap[index].ChronicDiseases),
                      onTap: null,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),*/
    );
  }
}

/*
 onPressed: () {
                      final res = PatientResolution(
                        id: "2",
                        height: _height.text,
                        age: _age.text,
                        Drugs: _Drugs.text,
                        ChronicDiseases: _ChronicDiseases.text,
                        PatientRID: "1",
                      );
                      print("/////////////////////////");
                      print(res.ChronicDiseases);
                      print("/////////////////////////");
                    },

*/
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
