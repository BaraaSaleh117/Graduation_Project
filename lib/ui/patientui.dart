// ignore: file_names
// ignore_for_file: unnecessary_const, avoid_unnecessary_containers, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'package:graduation_projectflutter/patientPage/ui_view/mediterranean_diet_view.dart';
import 'package:graduation_projectflutter/patientPage/ui_view/wave_view.dart';
import 'package:graduation_projectflutter/ui/mealsui/breakfast.dart';
import 'package:graduation_projectflutter/ui/mealsui/breakfastlistview.dart';
import 'package:graduation_projectflutter/ui/mealsui/dinner.dart';
import 'package:graduation_projectflutter/ui/mealsui/lunch.dart';
import 'package:graduation_projectflutter/ui/mealsui/snack.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PatientUi extends StatefulWidget {
  @override
  _PatientUiState createState() => _PatientUiState();
}

class _PatientUiState extends State<PatientUi> {
  var ListSearch = [];
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  var weightt;
  var Height;
  var Age;
  var Drugs;
  var ChronicDiseases;
  var Sugerb;

  var Weight;

  getweightPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      weightt = preferences.getString("weightt");
    });
    print("Your Weight is :" + weightt);
  }

  getSugerPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Sugerb = preferences.getString("Sugerb");
    });
    print("Your blood sugar level is : " + Sugerb);
  }

  getqPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Height = preferences.getString("Height");
      Age = preferences.getString("Age");
      Drugs = preferences.getString("Drugs");
      ChronicDiseases = preferences.getString("ChronicDiseases");
    });
    print(Height + Age + Drugs + ChronicDiseases);
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

  @override
  void initState() {
    getData();
    getweightPref();
    getqPref();
    getSugerPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late AnimationController? animationController;
    late Animation<double>? animation;
    if (weightt != null) {
      Weight = weightt;
    } else {
      Weight = "";
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Homepage",
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
          elevation: 6,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context, delegate: DataSearch(list: ListSearch));
                }),
          ],
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(bottom: 20),
                height: 250.0,
                width: double.infinity,
                child: Carousel(
                  images: [
                    Image.asset(
                      "lib/assets/a1.jpg",
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "lib/assets/a2.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "lib/assets/a3.jpg",
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "lib/assets/a4.jpg",
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "lib/assets/a6.jpg",
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "lib/assets/a7.jpg",
                      fit: BoxFit.fill,
                    ),
                  ],
                  dotColor: Colors.amber,
                  //dotBgColor: Colors.amber.withOpacity(0.5),
                  //  showIndicator: false,
                )),

            //End Carousel
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "Calories",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: FitnessAppTheme.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: const Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: const Radius.circular(68.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: FitnessAppTheme.grey.withOpacity(0.2),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 4),
                            child: Column(children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 48,
                                    width: 2,
                                    decoration: BoxDecoration(
                                      color:
                                          HexColor('#F56E98').withOpacity(0.5),
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(4.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, bottom: 2),
                                          child: Text(
                                            'Calories body needs :',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily:
                                                  FitnessAppTheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              letterSpacing: -0.1,
                                              color: FitnessAppTheme.grey
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 28,
                                              height: 28,
                                              child: Image.asset(
                                                  "lib/assets/fitness_app/burned.png"),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, bottom: 3),
                                              child: Text(
                                                '${(1200 * 1).toInt()}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontFamily:
                                                      FitnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 30,
                                                  color: FitnessAppTheme
                                                      .darkerText,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, bottom: 3),
                                              child: Text(
                                                'Kcal',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FitnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  letterSpacing: -0.2,
                                                  color: FitnessAppTheme.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 48,
                                    width: 2,
                                    decoration: BoxDecoration(
                                      color:
                                          HexColor('#87A0E5').withOpacity(0.5),
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(4.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, bottom: 2),
                                          child: Text(
                                            'Eaten',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily:
                                                  FitnessAppTheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              letterSpacing: -0.1,
                                              color: FitnessAppTheme.grey
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 28,
                                              height: 28,
                                              child: Image.asset(
                                                  "lib/assets/fitness_app/eaten.png"),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, bottom: 3),
                                              child: Text(
                                                '${(400 * 1).toInt()}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontFamily:
                                                      FitnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: FitnessAppTheme
                                                      .darkerText,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, bottom: 3),
                                              child: Text(
                                                'Kcal',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FitnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  letterSpacing: -0.2,
                                                  color: FitnessAppTheme.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Center(
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FitnessAppTheme.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(100.0),
                                      ),
                                      border: Border.all(
                                          width: 6,
                                          color: FitnessAppTheme.nearlyDarkBlue
                                              .withOpacity(0.2)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${(800 * 1).toInt()}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily:
                                                FitnessAppTheme.fontName,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 24,
                                            letterSpacing: 0.0,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Text(
                                          'Kcal left',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily:
                                                FitnessAppTheme.fontName,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            letterSpacing: 0.0,
                                            color: FitnessAppTheme.grey
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CustomPaint(
                                    painter: CurvePainter(colors: [
                                      FitnessAppTheme.nearlyDarkBlue,
                                      HexColor("#8A98E8"),
                                      HexColor("#8A98E8")
                                    ], angle: 130 + (360 - 140) * (1.0 - 1)),
                                    child: const SizedBox(
                                      width: 108,
                                      height: 108,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 8, bottom: 8),
                    child: Container(
                      height: 2,
                      decoration: const BoxDecoration(
                        color: FitnessAppTheme.background,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 8, bottom: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Carbs',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: -0.2,
                                  color: FitnessAppTheme.darkText,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Container(
                                  height: 4,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: HexColor('#87A0E5').withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(4.0)),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: ((70 / 1.2) * 1),
                                        height: 4,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            HexColor('#87A0E5'),
                                            HexColor('#87A0E5')
                                                .withOpacity(0.5),
                                          ]),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(4.0)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  '12g left',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color:
                                        FitnessAppTheme.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    'Protein',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      letterSpacing: -0.2,
                                      color: FitnessAppTheme.darkText,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Container(
                                      height: 4,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: HexColor('#F56E98')
                                            .withOpacity(0.2),
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(4.0)),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: ((70 / 2) * 1),
                                            height: 4,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                HexColor('#F56E98')
                                                    .withOpacity(0.1),
                                                HexColor('#F56E98'),
                                              ]),
                                              borderRadius: const BorderRadius
                                                      .all(
                                                  const Radius.circular(4.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      '30g left',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: FitnessAppTheme.grey
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    'Fat',
                                    style: const TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      letterSpacing: -0.2,
                                      color: FitnessAppTheme.darkText,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(right: 0, top: 4),
                                    child: Container(
                                      height: 4,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: HexColor('#F1B440')
                                            .withOpacity(0.2),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(4.0)),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: ((70 / 2.5) * 1),
                                            height: 4,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                HexColor('#F1B440')
                                                    .withOpacity(0.1),
                                                HexColor('#F1B440'),
                                              ]),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(4.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      '10g left',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: FitnessAppTheme.grey
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "Body Measurements",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: FitnessAppTheme.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(68.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: FitnessAppTheme.grey.withOpacity(0.2),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(left: 4, bottom: 8, top: 16),
                          child: Text(
                            'Weight',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: FitnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                letterSpacing: -0.1,
                                color: FitnessAppTheme.darkText),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 4, bottom: 3),
                                  child: Text(
                                    Weight! + " ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 32,
                                      color: FitnessAppTheme.nearlyDarkBlue,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8, bottom: 8),
                                  child: Text(
                                    'Kg',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      letterSpacing: -0.2,
                                      color: FitnessAppTheme.nearlyDarkBlue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.access_time,
                                      color:
                                          FitnessAppTheme.grey.withOpacity(0.5),
                                      size: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Text(
                                        'Today 8:26 AM',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          color: FitnessAppTheme.grey
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4, bottom: 14),
                                  child: Text(
                                    'InBody SmartScale',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      letterSpacing: 0.0,
                                      color: FitnessAppTheme.nearlyDarkBlue,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 8, bottom: 8),
                    child: Container(
                      height: 2,
                      decoration: const BoxDecoration(
                        color: FitnessAppTheme.background,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 8, bottom: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                Height,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: -0.2,
                                  color: FitnessAppTheme.darkText,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  'Height',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color:
                                        FitnessAppTheme.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  '20%',
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    letterSpacing: -0.2,
                                    color: FitnessAppTheme.darkText,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  'Body fat',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color:
                                        FitnessAppTheme.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '27.3 BMI',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      letterSpacing: -0.2,
                                      color: FitnessAppTheme.darkText,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      'Overweight',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: FitnessAppTheme.grey
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      Age,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.2,
                                        color: FitnessAppTheme.darkText,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      'Age',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: FitnessAppTheme.nearlyBlack
                                            .withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    Sugerb,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      letterSpacing: -0.2,
                                      color: FitnessAppTheme.nearlyDarkBlue,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      'Today s blood sugar ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: FitnessAppTheme.nearlyBlack
                                            .withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            //Start Meals
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "Meals Today",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //Start Meals Container
            Container(
              height: 160,
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: HexColor('#FA7D82').withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                    ),
                    height: 120,
                    width: 150,
                    child: ListTile(
                      title: Image.asset(
                        "lib/assets/fitness_app/breakfast.png",
                      ),
                      subtitle: Container(
                          child: const Text(
                        "BreakFast",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                      onTap: () {
                        //  Navigator.of(context).pushNamed("BreakFast");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BreakFastss()));
                      },
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      color: HexColor('#5C5EDD').withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                    ),
                    child: ListTile(
                      title: Image.asset(
                        "lib/assets/fitness_app/lunch.png",
                      ),
                      subtitle: Container(
                          child: const Text(
                        "Lunch",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Lunch()));
                      },
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      color: HexColor('#FA7D82').withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                    ),
                    child: ListTile(
                      title: Image.asset(
                        "lib/assets/fitness_app/snack.png",
                      ),
                      subtitle: Container(
                          child: const Text(
                        "Snack",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Snacks()));
                      },
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      color: HexColor('#5C5EDD').withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                    ),
                    child: ListTile(
                      title: Image.asset(
                        "lib/assets/fitness_app/dinner.png",
                      ),
                      subtitle: Container(
                          child: const Text(
                        "Dinner",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dinner()));
                      },
                    ),
                  )
                ],
              ),
            ),
            //End Meals Container

            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "Water",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // Start Water Containar ///
            Container(
              child: Container(
                decoration: BoxDecoration(
                  color: FitnessAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: FitnessAppTheme.grey.withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 16, right: 16, bottom: 16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, bottom: 3),
                                      child: Text(
                                        '2100',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 32,
                                          color: FitnessAppTheme.nearlyDarkBlue,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, bottom: 8),
                                      child: Text(
                                        'ml',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          letterSpacing: -0.2,
                                          color: FitnessAppTheme.nearlyDarkBlue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4, top: 2, bottom: 14),
                                  child: Text(
                                    'of daily goal 3.5L',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      letterSpacing: 0.0,
                                      color: FitnessAppTheme.darkText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4, right: 4, top: 8, bottom: 16),
                              child: Container(
                                height: 2,
                                decoration: BoxDecoration(
                                  color: FitnessAppTheme.background,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4.0)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Icon(
                                          Icons.access_time,
                                          color: FitnessAppTheme.grey
                                              .withOpacity(0.5),
                                          size: 16,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Text(
                                          'Last drink 8:26 AM',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily:
                                                FitnessAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            color: FitnessAppTheme.grey
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: Image.asset(
                                              'lib/assets/fitness_app/bell.png'),
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Your bottle is empty, refill it!.',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontFamily:
                                                  FitnessAppTheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                              color: HexColor('#F65283'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 34,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: FitnessAppTheme.nearlyWhite,
                                shape: BoxShape.circle,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: FitnessAppTheme.nearlyDarkBlue
                                          .withOpacity(0.4),
                                      offset: const Offset(4.0, 4.0),
                                      blurRadius: 8.0),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: FitnessAppTheme.nearlyWhite,
                                shape: BoxShape.circle,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: FitnessAppTheme.nearlyDarkBlue
                                          .withOpacity(0.4),
                                      offset: const Offset(4.0, 4.0),
                                      blurRadius: 8.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 8, top: 16),
                        child: Container(
                          width: 60,
                          height: 160,
                          decoration: BoxDecoration(
                            color: HexColor('#E8EDFE'),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(80.0),
                                bottomLeft: Radius.circular(80.0),
                                bottomRight: Radius.circular(80.0),
                                topRight: Radius.circular(80.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: FitnessAppTheme.grey.withOpacity(0.4),
                                  offset: const Offset(2, 2),
                                  blurRadius: 4),
                            ],
                          ),
                          child: WaveView(
                            percentageValue: 70.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  List<dynamic> list;

  var country_pref;
  DataSearch({required this.list});

  Future getSearchData() async {
    var url =
        "http://10.0.2.2/graduationProj/graduation_projectflutter/lib/fetch_api/searchmeals.php";
    var data = {'searchmeal': query};
    var res = await http.post(Uri.parse(url),
        body: data, headers: {"Accept": "application/json"});
    var responceBody = jsonDecode(res.body);
    return responceBody;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: const Icon(Icons.arrow_back_sharp),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: getSearchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return mealsList(
                      country: country_pref,
                      Id: snapshot.data[i]['Id']!,
                      Mealname: snapshot.data[i]['Mealname']!,
                      Mealtype: snapshot.data[i]['Mealtype']!,
                      Mealtime: snapshot.data[i]['Mealtime']!,
                      Calories: snapshot.data[i]['Calories']!,
                      Description: snapshot.data[i]['Description']!);
                });
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchList =
        query.isEmpty ? list : list.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: const Icon(Icons.ramen_dining_rounded),
            title: Text(searchList[i]),
            onTap: () {
              query = searchList[i];
              showResults(context);
            },
          );
        });
  }
}
