import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/dinnerslist.dart';
import 'package:graduation_projectflutter/components/lunchlist.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/components/searchmeals.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Lunch extends StatefulWidget {
  const Lunch({Key? key}) : super(key: key);

  @override
  _LunchState createState() => _LunchState();
}

class _LunchState extends State<Lunch> {
  var ListSearch = [];
  var country_pref;
  var carbs;
  var Cals;
  var Sugerb;
  late String Sucomments = "";
  double LunchCalories = 0.0;
  double LunchCarbs = 0.0;
  String mealType = "Lunch";
  double calorieLeft = 0.0;
  double calorieLeftAfterBreakfast = 0.0;
  double CarbsLeftAfterBreakfast = 0.0;
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

  Future getCalsAfterBreakfast() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    calsleft = preferences.getString("Calories")!;
    if (calsleft != null) {
      print("Your left Calories After BreakFasts is :" + calsleft);
    }
  }

  Future getCarbsAfterBreakfast() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Carbsleft = preferences.getString("Carpsleft")!;
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
    calorieLeftAfterBreakfast = double.parse(calsleft);
    CarbsLeftAfterBreakfast = double.parse(Carbsleft);

    if (mealType == "Lunch") {
      if (Sucomments == "Low") {
        carbsPercentag += (carbsPercentag * 0.03);
      }
      if (Sucomments == "Normal") {
        carbsPercentag += 0;
      }
      if (Sucomments == "High") {
        carbsPercentag -= (carbsPercentag * 0.03);
      }
      LunchCalories = calorieLeft * (40 / 100);
      LunchCarbs = carbsPercentag * (40 / 100);
      calorieLeft = calorieLeftAfterBreakfast - LunchCalories;
      CarbsLeft = CarbsLeftAfterBreakfast - LunchCarbs;
    }
    print("********//********");
    print("Lunch Calories = " + LunchCalories.toStringAsFixed(2));
    print("Lunch Carps = " + LunchCarbs.toStringAsFixed(2));
    print("Calorie Left = " + calorieLeft.toStringAsFixed(2));
    print("Carbs Left = " + CarbsLeft.toStringAsFixed(2));
    print("********//********");
  }

  SavecarbsCaloriesAfterLunch(String carbs) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("CarpsAlunch", carbs);
    print(preferences.getString("CarpsAlunch"));
  }

  SaveCalAfterLunch(String Cal) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("CaloriesAlunch", Cal);
    print(preferences.getString("CaloriesAlunch"));
  }

  @override
  void initState() {
    getCarbsPref();
    getCals();
    getSugerPref();
    print("NNNNNNNNNNNNNNNNNNNNNNNNNNN");
    getCalsAfterBreakfast();
    getCarbsAfterBreakfast();

    super.initState();
  }

  Future getLunchs() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/GetLunch.php";
    var data = {
      "Calories": LunchCalories.toString(),
      "lessCalories": (LunchCalories - 50).toString(),
      "mealtype": "lunch",
      "carbohydrate": LunchCarbs.toString(),
      "lesscarbohydrate": (LunchCarbs - 30).toString(),
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
    SavecarbsCaloriesAfterLunch(CarbsLeft.toString());
    SaveCalAfterLunch(calorieLeft.toString());
    return Scaffold(
        appBar: AppBar(
          title: Text("Lunchs"),
          centerTitle: true,
          backgroundColor: HexColor('#FA7D82').withOpacity(0.5),
          elevation: 6,
        ),
        body: FutureBuilder(
          future: getLunchs(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return LunchsList(
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
