import 'dart:convert';

import 'package:flutter/material.dart';
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
import 'package:graduation_projectflutter/models/patientsmodels.dart';
import 'package:graduation_projectflutter/models/patientsrecord.dart';
import 'package:graduation_projectflutter/models/resolution.dart';
import 'package:graduation_projectflutter/models/unfavoritefood.dart';
import 'package:http/http.dart' as http;

class FetchApi {
  getPatients() async {
    //Get Patients Data From Localhost API
    String theUrl =
        'http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getPatientsData.php';
    var res = await http.get(Uri.parse(Uri.encodeFull(theUrl)),
        headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    List<PatientsModel> patientsList = [];
    for (var u in responceBody) {
      patientsList.add(PatientsModel.fromJson(u));
    }
    return patientsList;
  }

  getPatientRecords() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getPatientsRecord.php";
    var res = await http.get(Uri.parse(Uri.encodeFull(theUrl)),
        headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    List<PatientsRecord> patientsList = [];
    for (var u in responceBody) {
      patientsList.add(PatientsRecord.fromJson(u));
    }
    return patientsList;
  }

  getDoctos() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getDoctors.php";
    var res = await http.get(Uri.parse(Uri.encodeFull(theUrl)),
        headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    List<Doctor> patientsList = [];
    for (var u in responceBody) {
      patientsList.add(Doctor.fromJson(u));
    }
    return patientsList;
  }

  getAppointments() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getappointments.php";
    var res = await http.get(Uri.parse(Uri.encodeFull(theUrl)),
        headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    List<Appointments> patientsList = [];
    for (var u in responceBody) {
      patientsList.add(Appointments.fromJson(u));
    }
    return patientsList;
  }

  getPatientResolution() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getResolution.php";
    var res = await http.get(Uri.parse(Uri.encodeFull(theUrl)),
        headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    List<PatientResolution> patientsList = [];
    for (var u in responceBody) {
      patientsList.add(PatientResolution.fromJson(u));
    }
    return patientsList;
  }

  getPatientLogin() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getPatinetsAccount.php";
    var res = await http.get(Uri.parse(Uri.encodeFull(theUrl)),
        headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    List<PatientLogin> patientsList = [];
    for (var u in responceBody) {
      patientsList.add(PatientLogin.fromJson(u));
    }
    return patientsList;
  }

  getDoctorLogin() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getDoctorAccount.php";
    var res = await http.get(Uri.parse(Uri.encodeFull(theUrl)),
        headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    List<DoctorLogin> patientsList = [];
    for (var u in responceBody) {
      patientsList.add(DoctorLogin.fromJson(u));
    }
    return patientsList;
  }

  getAllergicFood() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getallergicFood.php";
    var res = await http.get(Uri.parse(Uri.encodeFull(theUrl)),
        headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    List<AllergicFood> patientsList = [];
    for (var u in responceBody) {
      patientsList.add(AllergicFood.fromJson(u));
    }
    return patientsList;
  }

  getMeals() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getMeals.php";
    var res = await http.get(Uri.parse(Uri.encodeFull(theUrl)),
        headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    List<Meals> patientsList = [];
    for (var u in responceBody) {
      patientsList.add(Meals.fromJson(u));
    }
    return patientsList;
  }

  getFavoriteFood() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getFavoriteFood.php";
    var res = await http.get(Uri.parse(Uri.encodeFull(theUrl)),
        headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    List<FavoriteFood> patientsList = [];
    for (var u in responceBody) {
      patientsList.add(FavoriteFood.fromJson(u));
    }
    return patientsList;
  }

  getUnFavoriteFood() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getUnFavoriteFood.php";
    var res = await http.get(Uri.parse(Uri.encodeFull(theUrl)),
        headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    List<UnFavoriteFood> patientsList = [];
    for (var u in responceBody) {
      patientsList.add(UnFavoriteFood.fromJson(u));
    }
    return patientsList;
  }

  getFood() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getFood.php";
    var res = await http.get(Uri.parse(Uri.encodeFull(theUrl)),
        headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    List<Food> patientsList = [];
    for (var u in responceBody) {
      patientsList.add(Food.fromJson(u));
    }
    return patientsList;
  }

  getBalanceReading() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getBalancereading.php";
    var res = await http.get(Uri.parse(Uri.encodeFull(theUrl)),
        headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    List<BalanceReading> patientsList = [];
    for (var u in responceBody) {
      patientsList.add(BalanceReading.fromJson(u));
    }
    return patientsList;
  }

  getMealFoodRecord() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getmealfoodrecord.php";
    var res = await http.get(Uri.parse(Uri.encodeFull(theUrl)),
        headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    List<MealFoodRecord> patientsList = [];
    for (var u in responceBody) {
      patientsList.add(MealFoodRecord.fromJson(u));
    }
    return patientsList;
  }
}
