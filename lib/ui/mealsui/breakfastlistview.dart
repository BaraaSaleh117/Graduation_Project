import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BreakFastss extends StatefulWidget {
  const BreakFastss({Key? key}) : super(key: key);

  @override
  _BreakFastssState createState() => _BreakFastssState();
}

class _BreakFastssState extends State<BreakFastss> {
  Future getMeals() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getMeals.php";
    var res = await http
        .get(Uri.parse(theUrl), headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    return responceBody;
  }

  Future getBreakFasts() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getMeals.php";
    var data = {"mealtype": "Breakfast"};
    var res = await http.post(Uri.parse(theUrl),
        body: data, headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    return responceBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("               BreakFasts"),
          backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
        ),
        body: FutureBuilder(
          future: getBreakFasts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return mealsList(
                      Id: snapshot.data[i]['Id']!,
                      Mealname: snapshot.data[i]['Mealname']!,
                      Mealtype: snapshot.data[i]['Mealtype']!,
                      Mealtime: snapshot.data[i]['Mealtime']!,
                      Calories: snapshot.data[i]['Calories']!,
                      Description: snapshot.data[i]['Description']!);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
