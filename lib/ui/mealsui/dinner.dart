import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/dinnerslist.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/components/searchmeals.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Dinner extends StatefulWidget {
  const Dinner({Key? key}) : super(key: key);

  @override
  _DinnerState createState() => _DinnerState();
}

class _DinnerState extends State<Dinner> {
  var ListSearch = [];
  var country_pref;
  var carbs;
  var Cals;
  var Sugerb;
  late String Sucomments = "";
  double DinnerCalories = 0.0;
  double DinnerCarbs = 0.0;
  String mealType = "dinner";
  double calorieLeft = 0.0;
  double calorieLeftAfterSnack = 0.0;
  double CarbsLeftAfterSnack = 0.0;
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

  Future getCalsAfterSnack() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    calsleft = preferences.getString("CaloriesASnack");
    if (calsleft != null) {
      print("Your left Calories After Snack is :" + calsleft);
    }
  }

  Future getCarbsAfterSnack() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Carbsleft = preferences.getString("CarpsASnack");
    if (Carbsleft != null) {
      print("Your left Carpss After Snack is :" + Carbsleft);
    }
  }

  SaveCalAfterdinner(String Cal) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("C", Cal);
    print(preferences.getString("C"));
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
    calorieLeftAfterSnack = double.parse(calsleft);
    CarbsLeftAfterSnack = double.parse(Carbsleft);

    if (mealType == "dinner") {
      if (Sucomments == "Low") {
        carbsPercentag += (carbsPercentag * 0.03);
      }
      if (Sucomments == "Normal") {
        carbsPercentag += 0;
      }
      if (Sucomments == "High") {
        carbsPercentag -= (carbsPercentag * 0.03);
      }
      DinnerCalories = calorieLeft * (20 / 100);
      DinnerCarbs = carbsPercentag * (20 / 100);
      calorieLeft = calorieLeftAfterSnack - DinnerCalories;
      CarbsLeft = CarbsLeftAfterSnack - DinnerCarbs;
    }
    print("********//********");
    print("Dinner Calories = " + DinnerCalories.toStringAsFixed(2));
    print("Dinner Carps = " + DinnerCarbs.toStringAsFixed(2));
    print("Calorie Left = " + calorieLeft.toStringAsFixed(2));
    print("Carbs Left = " + CarbsLeft.toStringAsFixed(2));
    print("********//********");
  }

  @override
  void initState() {
    getCarbsPref();
    print("NNNNNNNNNNNNNNNNNNNNNNNNNNN");
    getCals();
    getSugerPref();

    getCalsAfterSnack();
    getCarbsAfterSnack();

    super.initState();
  }

  Future getDinner() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/GetDinner.php";
    var data = {
      "Calories": DinnerCalories.toString(),
      "lessCalories": (DinnerCalories - 50).toString(),
      "mealtype": "Dinner",
      "carbohydrate": DinnerCarbs.toString(),
      "lesscarbohydrate": (DinnerCarbs - 20).toString(),
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
    SaveCalAfterdinner(calorieLeft.toString());
    return Scaffold(
        appBar: AppBar(
          title: Text("Dinners"),
          centerTitle: true,
          backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
          elevation: 6,
        ),
        body: FutureBuilder(
          future: getDinner(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return DinnersList(
                      Id: snapshot.data[i]['Id']!,
                      url: snapshot.data[i]['url']!,
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
