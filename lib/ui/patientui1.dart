import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/dinnerslist.dart';
import 'package:graduation_projectflutter/components/lunchlist.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/components/patientslist.dart';
import 'package:graduation_projectflutter/components/searchmeals.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'package:graduation_projectflutter/ui/patientui.dart';
import 'package:graduation_projectflutter/ui/patientui2.5.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PatientUi1 extends StatefulWidget {
  const PatientUi1({Key? key}) : super(key: key);

  @override
  _DoctorUiState createState() => _DoctorUiState();
}

var username;
getusername() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  username = preferences.getString("username");
  if (username != null) {
    username = preferences.getString("username");
  }
  print(username);
}

var ListSearch = [];

class _DoctorUiState extends State<PatientUi1> {
  Future getPatient() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getpatient.php";
    var data = {
      "UserName": username,
    }; //
    var res = await http.post(Uri.parse(theUrl),
        body: data, headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    return responceBody;
  }

  @override
  Widget build(BuildContext context) {
    getusername();
    return Scaffold(
        appBar: AppBar(
          title: Text("Patient Record"),
          centerTitle: true,
          backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
          elevation: 6,
        ),
        body: FutureBuilder(
          future: getPatient(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return ListPatients(
                    Id: snapshot.data[i]['Id']!,
                    UserName: snapshot.data[i]['UserName'],
                    height: snapshot.data[i]['height']!,
                    weight: snapshot.data[i]['weight']!,
                    gender: snapshot.data[i]['gender']!,
                    age: snapshot.data[i]['age']!,
                    Drugs: snapshot.data[i]['Drugs']!,
                    ChronicDiseases: snapshot.data[i]['ChronicDiseases']!,
                    BloodSugerLevel: snapshot.data[i]['BloodSugerLevel']!,
                    Active: snapshot.data[i]['Active']!,
                    parpase: snapshot.data[i]['parpase']!,
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
