import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/dinnerslist.dart';
import 'package:graduation_projectflutter/components/lunchlist.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/components/patientslist.dart';
import 'package:graduation_projectflutter/components/searchmeals.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DoctorUi extends StatefulWidget {
  const DoctorUi({Key? key}) : super(key: key);

  @override
  _DoctorUiState createState() => _DoctorUiState();
}

var ListSearch = [];

class _DoctorUiState extends State<DoctorUi> {
  Future getPatientsDetails() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getPatinetsAccount.php";
    var res = await http
        .get(Uri.parse(theUrl), headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    return responceBody;
  }

  //$makeQuery =" SELECT account.Id , account.UserName , resolution.BloodSugerLevel FROM account INNER JOIN resolution ON account.ResId = resolution.id";
// "BloodSugerLevel" => $resultsForm['BloodSugerLevel'],
  // "ResId" => $resultsForm['ResId'],
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Doctor Page"),
          centerTitle: true,
          backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
          elevation: 6,
        ),
        body: FutureBuilder(
          future: getPatientsDetails(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return PatientsList(
                    Id: snapshot.data[i]['Id']!,
                    UserName: snapshot.data[i]['UserName']!,
                    height: snapshot.data[i]['height']!,
                    weight: snapshot.data[i]['weight']!,
                    age: snapshot.data[i]['age']!,
                    Drugs: snapshot.data[i]['Drugs']!,
                    ChronicDiseases: snapshot.data[i]['ChronicDiseases']!,
                    BloodSugerLevel: snapshot.data[i]['BloodSugerLevel']!,
                    HValue: snapshot.data[i]['HValue']!,
                    HDate: snapshot.data[i]['HDate']!,
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
