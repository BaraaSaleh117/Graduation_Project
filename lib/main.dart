import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_home_screen.dart';
import 'package:graduation_projectflutter/models/resolution.dart';
import 'package:graduation_projectflutter/ui/background.dart';
import 'package:graduation_projectflutter/ui/mealsui/Test.dart';
import 'package:graduation_projectflutter/ui/mealsui/breakfast.dart';
import 'package:graduation_projectflutter/ui/mealsui/details.dart';
import 'package:graduation_projectflutter/ui/mealsui/breakfastlistview.dart';
import 'package:graduation_projectflutter/ui/mealsui/dinner.dart';
import 'package:graduation_projectflutter/ui/mealsui/lunch.dart';
import 'package:graduation_projectflutter/ui/mealsui/snak.dart';
import 'package:graduation_projectflutter/ui/patientUi.dart';
import 'package:graduation_projectflutter/ui/resolution_list.dart';
import 'package:http/http.dart' as http;
import 'fetch_api/fetchapi.dart';

void main() {
  runApp(MyApp());
}

// Map<String, dynamic> data
Future<String> PostRes(PatientResolution item) async {
  String theUrl =
      'http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getResolution.php';
  try {
    var res = await http.post(Uri.parse(Uri.encodeFull(theUrl)),
        body: json.encode(item.toJson),
        headers: {"Accept": "application/json"});
    if (res.statusCode == 201) {
      return "success";
    } else {
      print(res.body);
      return "err";
    }
  } catch (SocketException) {
    return "err";
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FetchApi fetchApi = new FetchApi();
    TextEditingController _height = TextEditingController();
    TextEditingController _age = TextEditingController();
    TextEditingController _Drugs = TextEditingController();
    TextEditingController _ChronicDiseases = TextEditingController();
    return MaterialApp(
      title: '',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: BreakFastss(),
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
        "Snaks": (context) {
          return Snaks();
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
