import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/home.dart';
import 'package:graduation_projectflutter/models/allergicfood.dart';
import 'package:graduation_projectflutter/models/appointments.dart';
import 'package:graduation_projectflutter/models/balancereading.dart';
import 'package:graduation_projectflutter/models/doctoraccountlogin.dart';
import 'package:graduation_projectflutter/models/doctors.dart';
import 'package:graduation_projectflutter/models/favoritefood.dart';
import 'package:graduation_projectflutter/models/food.dart';
import 'package:graduation_projectflutter/models/mealfoodrecord.dart';
import 'package:graduation_projectflutter/models/meals.dart';
import 'package:graduation_projectflutter/models/patientaccountlogin.dart';
import 'package:graduation_projectflutter/models/patientsrecord.dart';
import 'package:graduation_projectflutter/models/resolution.dart';
import 'package:graduation_projectflutter/models/unfavoritefood.dart';

import 'package:graduation_projectflutter/ui/background.dart';
import 'package:http/http.dart' as http;
import 'fetch_api/fetchapi.dart';
import 'models/patientsmodels.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FetchApi fetchApi = new FetchApi();
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Background(),
      /*Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: FutureBuilder(
          future: fetchApi.getMealFoodRecord(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<MealFoodRecord> snap = snapshot.data;

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
                return Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Row(
                      children: [
                        Text(" "),
                        Text(snap[index].id),
                        Text("  "),
                        Text(snap[index].mealID),
                        Text("  "),
                        Text(snap[index].foodID),
                      ],
                    ));
              },
            );
          },
        ),
      ),*/
    );
  }
}
