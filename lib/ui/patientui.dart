import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'package:graduation_projectflutter/patientPage/ui_view/mediterranean_diet_view.dart';
import 'package:graduation_projectflutter/patientPage/ui_view/wave_view.dart';
import 'package:graduation_projectflutter/ui/allpatientcontentpage.dart';
import 'package:graduation_projectflutter/ui/connectwithscale.dart';
import 'package:graduation_projectflutter/ui/diabetesregulation.dart';
import 'package:graduation_projectflutter/ui/mealsui/breakfast.dart';
import 'package:graduation_projectflutter/ui/mealsui/dinner.dart';
import 'package:graduation_projectflutter/ui/mealsui/lunch.dart';
import 'package:graduation_projectflutter/ui/mealsui/snack.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class PatientUi extends StatefulWidget {
  late final String? Id;
  PatientUi({this.Id});
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
  var Id;
  var Active;
  late String Sucomments;
  var parpase;
  var HValue;
  var HDate;

  late double _bmi = 0.0;
  late String comments = "";
  bool ismale = false;
  double POFat = 0.0;
  double _Cal = 0.0;
  double Waterneeded = 0.0;
  double bound = 0.0;
  double carbs = 0.0;
  double proten = 0.0;
  double fat = 0.0;
  var date = DateTime.now();
  bool isCheck = false;
  var inbodycheck;
  double idealw = 0.0;
  var calsleftAfterBreakfast;
  var calsleftAfterlunch;
  var calsleftAfterSnack;
  var calsleftAfterdinner;
  double _cals = 0.0;
  double eaten = 0.0;
  var status;
  var gender;
  var username;
  bool isSignIn = false;
  int intId = 0;

  getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username = preferences.getString("username");
    if (username != null) {
      setState(() {
        username = preferences.getString("username");
        isSignIn = true;
      });
    }
    print(username);
  }

  Future getPatientID() async {
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/GetID.php";
    var data = {
      "UserName": username.toString().trim(),
    };
    var res = await http.post(Uri.parse(theUrl),
        body: data, headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);

    String ID = responceBody[0].toString() as String;
    String getid = ID[5] + ID[6];
    intId = int.parse(getid);
    print(intId);

    return intId;
  }

  getGender() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    gender = preferences.getString("gender");
    if (gender != null) {
      if (gender == "male") {
        ismale = true;
        print(gender);
      } else if (gender == "female") {
        ismale = false;
        print("User Gender is : " + gender);
      }
    } else {
      print("Error in determain Gender");
    }
  }

  void detetenfood() {
    eaten = _Cal - _cals;
    eaten = double.parse(eaten.toStringAsFixed(1));
  }

  void detInbody() {
    if (inbodycheck == "Sunday, 9:00 AM") {
      isCheck = true;
      print(inbodycheck);
    } else {
      print("No check inbody");
    }
  }

  SavecarbsCal(String carbs) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("carbss", carbs);
    print(preferences.getString("carbss"));
  }

  SaveCal(String Cal) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("Cals", Cal);
    print(preferences.getString("Cals"));
  }

  int getHeightint() {
    int _heightOfUser = int.parse(Height);

    return _heightOfUser;
  }

  int getweightint() {
    int _weightOfUser = int.parse(weightt);
    return _weightOfUser;
  }

  double CalculateWater() {
    if (weightt != null) {
      double _weightOfUser = double.parse(weightt);
      bound = _weightOfUser / 0.4536;
      Waterneeded = bound / 50;
      Waterneeded = double.parse(Waterneeded.toStringAsFixed(1));
    }

    return Waterneeded;
  }

  double getCaloris() {
    if (weightt != null && Height != null) {
      double _weightOfUser = double.parse(weightt);
      double _heightOfUser = double.parse(Height);
      int _Age = int.parse(Age);
      double Ac = getActiveSituation(Active);
      double p = getparpus(parpase);

      if (ismale) {
        _Cal = 66 + (_weightOfUser * 13.7) + (_heightOfUser * 5) - (_Age * 6.8);
        _Cal = (_Cal * Ac) + p;
      } else {
        _Cal =
            655 + (_weightOfUser * 9.6) + (_heightOfUser * 1.8) - (_Age * 4.7);
        _Cal = (_Cal * Ac) + p;
      }
    }

    return _Cal;
  }

  double getActiveSituation(Active) {
    double Ac = 0.0;
    if (Active != null) {
      if (Active == "Very active") {
        Ac = 1.725;
      } else if (Active == "Energetic") {
        Ac = 1.550;
      } else if (Active == "Active_From") {
        Ac = 1.375;
      } else {
        Ac = 1.25;
      }
    }
    return Ac;
  }

  double calculateCarbs() {
    if (carbs != null) {
      carbs = _Cal * 0.45;
      carbs = double.parse(carbs.toStringAsFixed(1));
    }

    return carbs;
  }

  double calculateProten() {
    if (_Cal != null) {
      double _weightOfUser = double.parse(weightt);
      proten = _Cal * 0.35;
      proten = double.parse(proten.toStringAsFixed(1));
    }

    return proten;
  }

  double calculateFat() {
    if (weightt != null) {
      double _weightOfUser = double.parse(weightt);
      if (ismale) {
        fat = (_weightOfUser * 1.082) + 94.42;
      } else {
        fat = (_weightOfUser * 0.732) + 8.987;
      }
      fat = double.parse(fat.toStringAsFixed(1));
    }
    return fat;
  }

  double getparpus(parpase) {
    double Ac = 0.0;
    if (parpase == "Maintain") {
      Ac = 0;
    } else if (parpase == "Gain") {
      Ac = 500;
    } else if (parpase == "Lose") {
      Ac = (-1 * 500);
    }

    return Ac;
  }

  Future getCalsAfterBreakfast() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    calsleftAfterBreakfast = preferences.getString("Calories")!;
    if (calsleftAfterBreakfast != null) {
      _cals = double.parse(calsleftAfterBreakfast);
      _cals = double.parse(_cals.toStringAsFixed(1));
    }
  }

  Future getCalsAfterLunch() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    calsleftAfterlunch = preferences.getString("CaloriesAlunch")!;
    if (calsleftAfterlunch != null) {
      _cals = double.parse(calsleftAfterlunch);
      _cals = double.parse(_cals.toStringAsFixed(1));
    }
  }

  Future getCalsAfterSnack() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    calsleftAfterSnack = preferences.getString("CaloriesASnack");
    if (calsleftAfterSnack != null) {
      _cals = double.parse(calsleftAfterSnack);
      _cals = double.parse(_cals.toStringAsFixed(1));
    }
  }

  Future getCalAfterdinner() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    calsleftAfterdinner = preferences.getString("C");
    if (calsleftAfterdinner != null) {
      _cals = double.parse(calsleftAfterdinner);
      _cals = double.parse(_cals.toStringAsFixed(1));
    }
  }

  getBMI(weightt, Height) {
    if (weightt != null && Height != null) {
      double _weightOfUser = double.parse(weightt);
      double _heightOfUser = double.parse(Height);
      _bmi = _weightOfUser / ((_heightOfUser / 100) * (_heightOfUser / 100));

      if (_bmi >= 18.5 && _bmi <= 25) {
        comments = "Fit";
      } else if (_bmi < 18.5) {
        comments = "Underweighted";
      } else if (_bmi > 25 && _bmi <= 30) {
        comments = "Overweighted";
      } else {
        comments = "Obesed";
      }
    }
    _bmi = double.parse(_bmi.toStringAsFixed(2));
  }

  getFat(_bmi, Age) {
    if (Age != null) {
      int age = int.parse(Age);

      if (ismale) {
        POFat = (((_bmi * 1.20) + (0.23 * age)) - 16.2);
      } else if (!ismale) {
        POFat = (((_bmi * 1.20) + (0.23 * age)) - 5.4);
      }
    }

    POFat = double.parse(POFat.toStringAsFixed(2));
  }

  getqPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if (Id != null) {
        Id = preferences.getString("Id");
      } else
        Id = intId.toString();
      Height = preferences.getString("Height");
      weightt = preferences.getString("weightt");
      Age = preferences.getString("aage");
      Drugs = preferences.getString("Drugs");
      ChronicDiseases = preferences.getString("ChronicDiseases");
      Active = preferences.getString("Active");
      parpase = preferences.getString("parpase");
      Sugerb = preferences.getString("Sugerb");
      HValue = preferences.getString("HValue");
      HDate = preferences.getString("HDate");
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

  Future PostData() async {
    var url =
        "http://10.0.2.2/graduationProj/graduation_projectflutter/lib/PostData/PostPatientdata.php";
    var data = {
      "ResId": intId.toString(),
      "height": Height.toString(),
      "weight": weightt.toString(),
      "age": Age.toString(),
      "gender": gender.toString(),
      "Drugs": Drugs.toString(),
      "ChronicDiseases": ChronicDiseases.toString(),
      "BloodSugerLevel": Sugerb.toString(),
      "Active": Active.toString(),
      "parpase": parpase.toString(),
      "HValue": HValue.toString(),
      "HDate": HDate.toString()
    };
    var responce = await http.post(Uri.parse(url), body: data);

    print(responce.body.toString());
  }

  double CalcIdelWeight() {
    if (Height != null) {
      double _heightOfUser = double.parse(Height);
      if (ismale) {
        idealw = 48 + 1.1 * (_heightOfUser - 150);
      } else {
        idealw = 45 + 0.9 * (_heightOfUser - 150);
      }
    }
    idealw = double.parse(idealw.toStringAsFixed(2));
    return idealw;
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    status = preferences.getString("status");
    if (status == "BreakFast") {
      setState(() {
        getCalsAfterBreakfast();
      });
    } else if (status == "Lunch") {
      setState(() {
        getCalsAfterLunch();
      });
    } else if (status == "Snack") {
      setState(() {
        getCalsAfterSnack();
      });
    } else if (status == "Dinner") {
      setState(() {
        getCalAfterdinner();
      });
    } else {
      setState(() {
        eaten = 0.0;
        _cals = _Cal;
      });
    }
  }

  @override
  void initState() {
    getUserName();
    // getPatientID();
    getGender();

    getqPref();

    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getBMI(weightt, Height);
    getFat(_bmi, Age);
    getCaloris();
    CalculateWater();
    calculateCarbs();
    inbodycheck = (DateFormat('EEEE, h:mm a').format(date));
    detetenfood();
    //getPref(); ///////////////////////////////////////////////////////////////////////////////////

    calculateProten();

    calculateFat();

    SavecarbsCal(carbs.toString());
    SaveCal(_Cal.toString());
    CalcIdelWeight();

    getPatientID();

    PostData();

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
            "Body Measurements",
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: HexColor('#FA7D82').withOpacity(0.9),
          elevation: 6,
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
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
                                                '${(_Cal * 1).toInt()}',
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
                              // IconButton(
                              //     icon: new Image.asset('lib/assets/wws.png'),
                              //     iconSize: 5,
                              //     tooltip: 'New Check',
                              //     onPressed: PostData),
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
                                                '$eaten',
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
                                          '${(_cals)}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily:
                                                FitnessAppTheme.fontName,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18,
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
                                    painter: CurvePainter(
                                        colors: [
                                          FitnessAppTheme.nearlyDarkBlue,
                                          HexColor("#8A98E8"),
                                          HexColor("#8A98E8")
                                        ],
                                        angle: eaten * 67 / 360 +
                                            (360 - 140) * (1.0 - 1)),
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
                                  height: 7,
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
                                        height: 7,
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
                                  '$carbs kcal',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
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
                                      height: 7,
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
                                            height: 7,
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
                                      '$proten Kcal',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
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
                                      height: 7,
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
                                            width: ((60 / 2.5) * 1),
                                            height: 7,
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
                                      '$fat Kcal',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
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
            isCheck
                ? Container(
                    decoration: BoxDecoration(
                      color: FitnessAppTheme.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: const Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topRight: const Radius.circular(40.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: FitnessAppTheme.nearlyBlack.withOpacity(0.7),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    padding:
                        EdgeInsets.only(top: 5, bottom: 10, left: 5, right: 5),
                    // color: Colors.red.shade100,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Image.asset(
                                  "lib/assets/fitness_app/bell.png"),
                              width: 40,
                              height: 40,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Do not forget to measure your weight today before breakfast",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("measure"),
                            IconButton(
                              icon: Icon(Icons.offline_pin_outlined),
                              iconSize: 40,
                              tooltip: 'New Check',
                              onPressed: () {
                                isCheck = false;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ConnectScale()));
                              },
                            ),
                          ],
                        ),
                      ],
                    ))
                : Container(),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "Body Details",
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
                                    Weight != null ? Weight : "",
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
                                        (DateFormat('EEEE , h:mm a')
                                            .format(date)),
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
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 4, bottom: 8, top: 16),
                                  child: Text(
                                    'Ideal Weight',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        letterSpacing: -0.1,
                                        color: FitnessAppTheme.darkText),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 4, bottom: 3, top: 0),
                                  child: Text(
                                    '$idealw',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25,
                                        color: Colors.orange.withOpacity(0.9)),
                                  ),
                                ),
                              ],
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
                                  color: Colors.orange.withOpacity(0.9),
                                ),
                              ),
                            ),
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
                                Height + " cm",
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
                                  '$POFat' + "%",
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
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
                                    "BMI",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      letterSpacing: 2,
                                      color:
                                          FitnessAppTheme.grey.withOpacity(0.5),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '$_bmi',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      letterSpacing: -0.2,
                                      color: FitnessAppTheme.darkText,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 6),
                                    child: Container(
                                      child: RichText(
                                          text: TextSpan(children: <TextSpan>[
                                        TextSpan(
                                          text: comments,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.brown.shade600,
                                          ),
                                        ),
                                      ])),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 4, top: 16),
                                    child: Text(
                                      'Age',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          letterSpacing: -0.1,
                                          color: FitnessAppTheme.darkText),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      Age != null ? Age : "",
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                          "Your body's daily need for water ",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily:
                                                FitnessAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            letterSpacing: 0.4,
                                            color: HexColor('#F65283'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, bottom: 3),
                                      child: Text(
                                        '$Waterneeded',
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
                                        'Letter',
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
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4, right: 4, top: 8, bottom: 5),
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
                              padding: const EdgeInsets.only(top: 5),
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
                                        padding: const EdgeInsets.only(
                                            left: 4, bottom: 8),
                                        child: Icon(
                                          Icons.water_rounded,
                                          color: FitnessAppTheme.grey
                                              .withOpacity(0.5),
                                          size: 16,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4.0, bottom: 10),
                                        child: Text(
                                          'Benefits of sticking to drinking water',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily:
                                                FitnessAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            color: FitnessAppTheme.grey
                                                .withOpacity(0.8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Text(
                                      '1. Helps lower blood sugar levels' +
                                          "\n" +
                                          "2. Helps prevent dehydration" +
                                          "\n" +
                                          "3. Prevents skin infection" +
                                          "\n" +
                                          "4. Helps Prevent Fatigue:" +
                                          "\n",
                                      textAlign: TextAlign.start,
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
                            percentageValue: 80.0,
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
