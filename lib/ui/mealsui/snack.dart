import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/dinnerslist.dart';
import 'package:graduation_projectflutter/components/lunchlist.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/components/searchmeals.dart';
import 'package:graduation_projectflutter/components/snacklist.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Snacks extends StatefulWidget {
  const Snacks({Key? key}) : super(key: key);

  @override
  _SnacksState createState() => _SnacksState();
}

class _SnacksState extends State<Snacks> {
  var ListSearch = [];
  var country_pref;
  var carbs;
  var Cals;
  var Sugerb;
  late String Sucomments = "";
  double SnackCalories = 0.0;
  double SnackCarbs = 0.0;
  String mealType = "Snack";
  double calorieLeft = 0.0;
  double calorieLeftAfterLunch = 0.0;
  double CarbsLeftAfterLunch = 0.0;
  double carbsPercentag = 0.0;
  double CarbsLeft = 0.0;
  var calsleft;
  var Carbsleft;

  Future getCarbsPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    carbs = preferences.getString("carbss")!;
    if (carbs != null) {
      print("Your Carbs is :" + carbs);
    }
  }

  Future getCals() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Cals = preferences.getString("Cals")!;
    if (Cals != null) {
      print("Your Cals is :" + Cals);
    }
  }

  Future getCalsAfterLunch() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    calsleft = preferences.getString("CaloriesAlunch")!;
    if (calsleft != null) {
      print("Your left Calories After BreakFasts is :" + calsleft);
    }
  }

  Future getCarbsAfterLunch() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Carbsleft = preferences.getString("CarpsAlunch")!;
    if (Carbsleft != null) {
      print("Your left Carpss After BreakFasts is :" + Carbsleft);
    }
  }

  getSugerPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Sugerb = preferences.getString("Sugerb");
    });
    print("Your blood sugar level is : " + Sugerb);
  }

  detSugerLevel(Sugerb) {
    if (Sugerb != null) {
      double Sugerv = double.parse(Sugerb);
      if (Sugerv <= 90) {
        Sucomments = "Low";
      } else if (Sugerv > 90 && Sugerv <= 120) {
        Sucomments = "Normal";
      } else if (Sugerv > 120 && Sugerv <= 160) {
        Sucomments = "High";
      } else {
        Sucomments = "Dangerous!";
        print(
            Sucomments + "///////888888888888888888888888888888"); //Dangerous!
      }
    }
  }

  void calculateMeal(Sucomments, mealType) {
    carbsPercentag = double.parse(carbs);
    calorieLeft = double.parse(Cals);
    calorieLeftAfterLunch = double.parse(calsleft);
    CarbsLeftAfterLunch = double.parse(Carbsleft);

    if (mealType == "Snack") {
      if (Sucomments == "Low") {
        carbsPercentag += (carbsPercentag * 0.03);
      }
      if (Sucomments == "Normal") {
        carbsPercentag += 0;
      }
      if (Sucomments == "High") {
        carbsPercentag -= (carbsPercentag * 0.03);
      }
      SnackCalories = calorieLeft * (10 / 100);
      SnackCarbs = carbsPercentag * (10 / 100);
      calorieLeft = calorieLeftAfterLunch - SnackCalories;
      CarbsLeft = CarbsLeftAfterLunch - SnackCarbs;
    }
    print("********//********");
    print("Snack Calories = " + SnackCalories.toStringAsFixed(2));
    print("Snack Carps = " + SnackCarbs.toStringAsFixed(2));
    print("Calorie Left = " + calorieLeft.toStringAsFixed(2));
    print("Carbs Left = " + CarbsLeft.toStringAsFixed(2));
    print("********//********");
  }

  @override
  void initState() {
    getCarbsPref();
    getCals();
    getSugerPref();
    print("NNNNNNNNNNNNNNNNNNNNNNNNNNN");
    getCalsAfterLunch();
    getCarbsAfterLunch();

    super.initState();
  }

  SavecarbsCaloriesAfterSnack(String carbs) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("CarpsASnack", carbs);
    print(preferences.getString("CarpsASnack"));
  }

  SaveCalAfterSnack(String Cal) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("CaloriesASnack", Cal);
    print(preferences.getString("CaloriesASnack"));
  }

  Future getSnacks() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/GetSnack.php";
    var data = {
      "Calories": SnackCalories.toString(),
      "lessCalories": (SnackCalories - 50).toString(),
      "mealtype": "Snack",
      "carbohydrate": SnackCarbs.toString(),
      "lesscarbohydrate": (SnackCarbs - 30).toString(),
    };
    var res = await http.post(Uri.parse(theUrl),
        body: data, headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    return responceBody;
  }

  @override
  Widget build(BuildContext context) {
    detSugerLevel(Sugerb);
    calculateMeal(Sucomments, mealType);
    SavecarbsCaloriesAfterSnack(CarbsLeft.toString());
    SaveCalAfterSnack(calorieLeft.toString());

    return Scaffold(
        appBar: AppBar(
          title: Text("Snacks"),
          centerTitle: true,
          backgroundColor: HexColor('#FA7D82').withOpacity(0.5),
          elevation: 6,
        ),
        body: FutureBuilder(
          future: getSnacks(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return SnacksList(
                      Id: snapshot.data[i]['Id']!,
                      url: snapshot.data[i]['url']!,
                      Mealname: snapshot.data[i]['Mealname']!,
                      Mealtype: snapshot.data[i]['Mealtype']!,
                      Mealtime: snapshot.data[i]['Mealtime']!,
                      Calories: snapshot.data[i]['Calories']!,
                      carbohydrate: snapshot.data[i]['carbohydrate']!,
                      Description: snapshot.data[i]['Description']!,
                      Nutrients: snapshot.data[i]['Nutrients']!,
                      Howtoprepare: snapshot.data[i]['Howtoprepare']!);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
