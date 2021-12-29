import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BreakFastss extends StatefulWidget {
  const BreakFastss({Key? key}) : super(key: key);

  @override
  _BreakFastssState createState() => _BreakFastssState();
}

class _BreakFastssState extends State<BreakFastss> {
  var ListSearch = [];
  var country_pref;
  var carbs;
  var Cals;
  var Sugerb;
  late String Sucomments = "";
  double breakFastCalories = 0.0;
  double breakFastCarbs = 0.0;
  String mealType = "breakfast";
  double calorieLeft = 0.0;
  double carbsPercentag = 0.0;
  double CarbsLeft = 0.0;

  Future getCarbsPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    carbs = preferences.getString("carbss")!;
    if (carbs != null) {
      print("Your Carbs is :" + carbs.toStringAsFixed(2));
    }
  }
  // double getEaten (){

  // }

  Future getCals() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Cals = preferences.getString("Cals")!;
    if (Cals != null) {
      print("Your Cals is :" + Cals.toStringAsFixed(2));
    }
  }

  getSugerPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Sugerb = preferences.getString("Sugerb");
    });
    print("Your blood sugar level is : " + Sugerb.toStringAsFixed(2));
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

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      country_pref = preferences.getString("country");
    });

    print(country_pref);
  }

  void calculateMeal(Sucomments, mealType) {
    carbsPercentag = double.parse(carbs);
    calorieLeft = double.parse(Cals);

    if (mealType == "breakfast") {
      if (Sucomments == "Low") {
        carbsPercentag += (carbsPercentag * 0.03);
      }
      if (Sucomments == "Normal") {
        carbsPercentag += 0;
      }
      if (Sucomments == "High") {
        carbsPercentag -= (carbsPercentag * 0.03);
      }
      breakFastCalories = calorieLeft * (28 / 100);
      breakFastCarbs = carbsPercentag * (28 / 100);
      calorieLeft = calorieLeft - breakFastCalories;
      CarbsLeft = carbsPercentag - breakFastCarbs;
    }
    print("********//********");
    print("BreakFast Calories = " + breakFastCalories.toStringAsFixed(2));
    print("BreakFast Carps = " + breakFastCarbs.toStringAsFixed(2));
    print("Calorie Left = " + calorieLeft.toStringAsFixed(2));
    print("Carbs Left = " + CarbsLeft.toStringAsFixed(2));
    print("********//********");
  }

  SavecarbsCal(String carbs) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("Carpsleft", carbs);
    print(preferences.getString("Carpsleft"));
  }

  SaveCal(String Cal) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("Calories", Cal);
    print(preferences.getString("Calories"));
  }

  @override
  void initState() {
    getCarbsPref();
    getCals();
    getSugerPref();

    //getPref();
    getData();
    super.initState();
  }

  Future getData() async {
    var url =
        "http://10.0.2.2/graduationProj/graduation_projectflutter/lib/fetch_api/getmealss.php";
    var res =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    for (int i = 0; i < responceBody.length; i++) {
      ListSearch.add(responceBody[i]['Mealname']);
    }
  }

  Future getMeals() async {
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getmealss.php";
    var res = await http
        .get(Uri.parse(theUrl), headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    return responceBody;
  }

  Future getBreakFasts() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/GetBreakFasts.php";
    var data = {
      "Calories": breakFastCalories.toString(),
      "lessCalories": (breakFastCalories - 50).toString(),
      "mealtype": "Breakfast",
      "carbohydrate": breakFastCarbs.toString(),
      "lesscarbohydrate": (breakFastCarbs - 30).toString(),
    }; //
    var res = await http.post(Uri.parse(theUrl),
        body: data, headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    return responceBody;
  }

  @override
  Widget build(BuildContext context) {
    detSugerLevel(Sugerb);
    calculateMeal(Sucomments, mealType);

    SavecarbsCal(CarbsLeft.toString());
    SaveCal(calorieLeft.toString());

    return Scaffold(
        appBar: AppBar(
          title: Text("BreakFasts"),
          centerTitle: true,
          backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
          elevation: 6,
        ),
        body: FutureBuilder(
          future: getBreakFasts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return mealsList(
                      country: country_pref,
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


  






//  showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text("Search"),
//                           content: Container(
//                             height: 120,
//                             child: Column(
//                               children: [
//                                 Text(
//                                     "Enter the name of the meal you want to search for"),
//                                 TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: "Write here",
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           actions: <Widget>[
//                             FlatButton(onPressed: () {}, child: Text("Ok")),
//                             FlatButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: Text("Exit")),
//                           ],
//                         );
//                       });
//                 },
 
