import 'dart:convert';
import 'dart:developer';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'package:graduation_projectflutter/patientPage/ui_view/mediterranean_diet_view.dart';
import 'package:graduation_projectflutter/ui/allpatientcontentpage.dart';
import 'package:graduation_projectflutter/ui/mealsui/breakfast.dart';
import 'package:graduation_projectflutter/ui/mealsui/dinner.dart';
import 'package:graduation_projectflutter/ui/mealsui/snack.dart';
import 'package:graduation_projectflutter/ui/resolution_a.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'mealsui/lunch.dart';

class DiabetesReg extends StatefulWidget {
  const DiabetesReg({Key? key}) : super(key: key);

  @override
  _DiabetesRegState createState() => _DiabetesRegState();
}

var Sugerb;
late String Sucomments = "";
var ListSearch = [];
var date = DateTime.now();
var lastcheck;
var Days;
bool Ismessage = false;
var DocMessage = "";
var Username;
bool isSign = false;
var carbs;
bool ok = true;
var hour = (DateFormat('h:mm a').format(date));
bool hourtime = false;
bool ques = true;

bool isEmargincy = true;

TextEditingController Eten = TextEditingController();
savePref(String status) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString("status", status);
  print(preferences.getString("status"));
}

void _showToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Added to favorite'),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

Future getmsgFromDoctorPref() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  DocMessage = preferences.getString("DocMessage")!;
  if (DocMessage != null) {
    Ismessage = true;
    print(DocMessage);
  }
}

Future getCarbsPref() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  carbs = preferences.getString("carbss")!;
  if (carbs != null) {
    print("Your Carbs is :" + carbs);
  }
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

Future PostChart() async {
  var url =
      "http://10.0.2.2/graduationProj/graduation_projectflutter/lib/PostData/ChartData.php";
  var data = {
    "Days": Days,
    "SugerLevel": Sugerb,
  };
  var responce = await http.post(Uri.parse(url), body: data);
  print("*******");
  print(responce.body.toString());
}

Future getCData() async {
  var url =
      "http://10.0.2.2/graduationProj/graduation_projectflutter/lib/fetch_api/Getdayssuger.php";
  var res =
      await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  var responceBody = json.decode(res.body);
  for (int i = 0; i < responceBody.length; i++) {
    ListSearch.add(responceBody[i]['Days']['SugerLevel']);
  }
}

class _DiabetesRegState extends State<DiabetesReg> {
  getDoctorUseNamePref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Username = preferences.getString("Username");
    if (Username != null) {
      setState(() {
        Username = preferences.getString("Username");
        isSign = true;
      });
    }
    print(Username);
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
        Sucomments = "Dangerous!"; //Dangerous!
      }
    }
  }

  void dethour() {
    if (hour == "9:00 AM" || hour == "2:00 PM" || hour == "7:00 PM") {
      hourtime = true;
      print(hour);
    } else {
      print("Not Mached");
    }
  }

  void detChecker() {
    if (hour == "9:00 AM" ||
        hour == "9:01 AM" ||
        hour == "9:02 AM" ||
        hour == "9:03 AM" ||
        hour == "9:04 AM" ||
        hour == "9:05 AM" ||
        hour == "2:00 PM" ||
        hour == "2:01 PM" ||
        hour == "2:02 PM" ||
        hour == "2:03 PM" ||
        hour == "2:04 PM" ||
        hour == "2:05 PM" ||
        hour == "10:00 PM" ||
        hour == "10:01 PM" ||
        hour == "10:02 PM" ||
        hour == "10:03 PM" ||
        hour == "10:04 PM" ||
        hour == "10:05 PM") {
      PostChart();
    } else {
      print("Open agin in 9 or 2 or 10 PM");
    }
  }

  @override
  void initState() {
    getData();
    getSugerPref();
    getmsgFromDoctorPref();
    getDoctorUseNamePref();
    getCarbsPref();
    getdata().then((value) => suger = value);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Days = (DateFormat('EEEE').format(date));
    lastcheck = (DateFormat('EEEE , h:mm a').format(date));
    dethour();
    detChecker();
    detSugerLevel(Sugerb);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Health Condition",
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
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
                padding: const EdgeInsets.only(bottom: 20),
                height: 250.0,
                width: double.infinity,
                child: Carousel(
                  images: [
                    Image.asset(
                      "lib/assets/a1.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "lib/assets/a2.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "lib/assets/a3.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "lib/assets/a4.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "lib/assets/a6.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "lib/assets/a7.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "lib/assets/meals/14.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "lib/assets/meals/18.jpg",
                      fit: BoxFit.cover,
                    ),
                  ],
                  dotColor: Colors.amber,
                  //dotBgColor: Colors.amber.withOpacity(0.5),
                  //  showIndicator: false,
                )),

            Sucomments == "Dangerous!" && Ismessage && ok
                ? Container(
                    decoration: BoxDecoration(
                      color: FitnessAppTheme.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(68.0),
                          bottomLeft: const Radius.circular(68.0),
                          bottomRight: Radius.circular(68.0),
                          topRight: const Radius.circular(68.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: FitnessAppTheme.nearlyBlack.withOpacity(0.7),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    padding:
                        EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                    // color: Colors.red.shade100,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                  'lib/assets/fitness_app/bell.png'),
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5, bottom: 5),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Dr ." + Username,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                              right: 5,
                            )),
                            Flexible(
                              child: Text(
                                DocMessage,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  letterSpacing: 0.4,
                                  color: HexColor('#F65283'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: new Image.asset('lib/assets/ok.jpg'),
                          iconSize: 40,
                          tooltip: 'New Check',
                          onPressed: () {
                            ok = false;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AllPatientContentPage()));
                          },
                        ),
                      ],
                    ))
                : Container(
                    child: Text(""),
                  ), ////////////////////////////////////////////////////////////
            Container(
                decoration: BoxDecoration(
                  color: FitnessAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(68.0),
                      bottomLeft: const Radius.circular(68.0),
                      bottomRight: Radius.circular(68.0),
                      topRight: const Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: FitnessAppTheme.nearlyBlack.withOpacity(0.7),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),

                // color: Colors.red.shade100,
                child: Column(
                  children: [
                    ok && Sucomments != "Dangerous!" && hourtime
                        ? Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                          'lib/assets/fitness_app/bell.png'),
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, bottom: 17, right: 5, top: 10),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Please commitment to the medication schedule prescribed by the doctor",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon:
                                          new Image.asset('lib/assets/ok.jpg'),
                                      iconSize: 50,
                                      tooltip: 'New Check',
                                      onPressed: () {
                                        ok = false;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AllPatientContentPage()));
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                )),

            Container(
                padding: const EdgeInsets.all(20),
                child: const Text("Blood Sugar Status",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
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
                              child: Column(children: <Widget>[]),
                            ),
                          ),
                        ],
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
                                  'Low ',
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
                                      color:
                                          HexColor('#87A0E5').withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(4.0)),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: ((80 / 1.2) * 1),
                                          height: 20,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Colors.amber,
                                              Colors.amber.withOpacity(0.5),
                                            ]),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(9.0)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    ' < 90 ' + 'mg/dL',
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
                                      'Normal',
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
                                              width: ((135 / 2) * 1),
                                              height: 4,
                                              decoration: BoxDecoration(
                                                gradient:
                                                    LinearGradient(colors: [
                                                  Colors.green,
                                                  Colors.green,
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
                                        '90 - 120 mg/dL',
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
                                    Text(
                                      'High',
                                      style: const TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.2,
                                        color: FitnessAppTheme.darkText,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 0, top: 4),
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
                                              width: ((160 / 2.5) * 1),
                                              height: 4,
                                              decoration: BoxDecoration(
                                                gradient:
                                                    LinearGradient(colors: [
                                                  Colors.red.withOpacity(0.5),
                                                  Colors.red.withOpacity(0.5),
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
                                        '120 - 160 mg/dL',
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
                                      'Dangerous !',
                                      style: const TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.2,
                                        color: FitnessAppTheme.darkText,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 0, top: 4),
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
                                              width: ((160 / 2.5) * 1),
                                              height: 4,
                                              decoration: BoxDecoration(
                                                gradient:
                                                    LinearGradient(colors: [
                                                  Colors.red.shade900,
                                                  Colors.red.shade900,
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
                                        ' > 160  mg/dL',
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
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                ' Your Last measurement was ',
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
                            Text(
                              Sugerb != null ? Sugerb : "",
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
                                lastcheck != null ? lastcheck : "",
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
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                "Your Status is : ",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                  color: FitnessAppTheme.nearlyBlack
                                      .withOpacity(0.7),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Sucomments == "Dangerous!"
                                    ? Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.medical_services,
                                                color: Colors.red.shade900,
                                                size: 40,
                                              ),
                                              Text(
                                                " " + Sucomments,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          ListTile(
                                            title: Text(
                                              "You should see a doctor as soon as possible !",
                                              style: TextStyle(
                                                color: Colors.red.shade900,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            leading: Icon(
                                              Icons.run_circle_sharp,
                                              color: Colors.teal,
                                              size: 30,
                                            ),
                                            onTap: () {
                                              _showToast(context);
                                            },
                                          ),
                                        ],
                                      )
                                    : Sucomments == "High"
                                        ? Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.mood_bad_outlined,
                                                    color: Colors.black,
                                                    size: 40,
                                                  ),
                                                  Text(
                                                    "  " + Sucomments + " !",
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Sucomments == "Normal"
                                            ? Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.mood,
                                                        color: Colors.black,
                                                        size: 40,
                                                      ),
                                                      Text(
                                                        " " + Sucomments,
                                                        style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.mood_bad_rounded,
                                                        color: Colors.black,
                                                        size: 40,
                                                      ),
                                                      Text(
                                                        " " + Sucomments,
                                                        style: TextStyle(
                                                          color: Colors
                                                              .amber.shade700,
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                )),
            //////////////////////////
            ///
            SizedBox(
              height: 20,
            ),
            ques && Sucomments == "High"
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
                              child: Image.asset("lib/assets/EN.png"),
                              width: 40,
                              height: 40,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "The reason for the high level of sugar in your blood is that you may have experienced a difficult psychological condition today or that you ate something that contains large amounts of sugar",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "If the reason is from eating",
                            style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Enter here the last thing you ate And please commit to the suggested healthy meals",
                            style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        TextField(
                            controller: Eten,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Meal Name',
                            ),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        ListTile(
                          title: Text(
                            "Please check again in 8 hours",
                            style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Ok"),
                            IconButton(
                              icon: Icon(Icons.offline_pin_outlined),
                              iconSize: 40,
                              tooltip: 'New Check',
                              onPressed: () {
                                ques = false;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AllPatientContentPage()));
                              },
                            ),
                          ],
                        ),
                      ],
                    ))
                : Container(),
            ques && Sucomments == "Low"
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
                              child: Image.asset("lib/assets/EN.png"),
                              width: 40,
                              height: 40,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Your diabetes level is very low, please adhere to the suggested meals",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Please check again in 8 hours",
                            style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Ok"),
                            IconButton(
                              icon: Icon(Icons.offline_pin_outlined),
                              iconSize: 40,
                              tooltip: 'New Check',
                              onPressed: () {
                                ques = false;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AllPatientContentPage()));
                              },
                            ),
                          ],
                        ),
                      ],
                    ))
                : Container(),

            SizedBox(
              height: 20,
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 1, left: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 26),
                              child: Text(
                                'You should do a checkup at least once a day in the normal case',
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
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                'To do another blood sugar test, click here',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: FitnessAppTheme.nearlyBlue
                                      .withOpacity(0.9),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: new Image.asset('lib/assets/wws.png'),
                              iconSize: 40,
                              tooltip: 'New Check',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResolutionA()));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
            //Meals Containar ////////////
            Sucomments == "Dangerous!"
                ? Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 4, right: 4, top: 8, bottom: 5),
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: FitnessAppTheme.background,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                            ),
                          ),
                        ),
                        Text(
                          "Your blood sugar level is too high, we can't suggest meals for you",
                          style: TextStyle(
                              fontSize: 20,
                              color: HexColor('#5C5EDD').withOpacity(0.9),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 4, right: 4, top: 8, bottom: 5),
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: FitnessAppTheme.background,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.only(top: 30, left: 20),
                        child: const Text(
                          "Meals Today",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: FitnessAppTheme.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              bottomLeft: const Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topRight: const Radius.circular(3.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: FitnessAppTheme.grey.withOpacity(0.1),
                                offset: const Offset(1.1, 1.1),
                                blurRadius: 4.0),
                          ],
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(top: 1, left: 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                            'Here we provide you with some healthy meals ',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily:
                                                    FitnessAppTheme.fontName,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: Text(
                                            'based on your health condition',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily:
                                                    FitnessAppTheme.fontName,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.orange),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 6, bottom: 20),
                                          child: Text(
                                            'Help us maintain your health, to achieve the desired goal',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily:
                                                  FitnessAppTheme.fontName,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: FitnessAppTheme.nearlyBlue
                                                  .withOpacity(0.9),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]),
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
                                color: FitnessAppTheme.grey.withOpacity(0.1),
                                offset: const Offset(1.1, 1.1),
                                blurRadius: 4.0),
                          ],
                        ),
                        height: 160,
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 20),
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
                                  savePref("BreakFast");
                                  //  Navigator.of(context).pushNamed("BreakFast");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BreakFastss()));
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
                                  savePref("Lunch");
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
                                  savePref("Snack");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Snacks()));
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
                                  savePref("Dinner");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Dinner()));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),

            Container(
              padding: EdgeInsets.only(top: 25, left: 20),
              child: const Text(
                "Chart",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                'Your blood sugar level during the week',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FitnessAppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: FitnessAppTheme.grey.withOpacity(0.6),
                ),
              ),
            ),
            Container(
              height: 300,
              child: charts.BarChart(
                chartData(suger),
                animate: true,
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

//***************************************************** */
List<Suger> fromJson(String strJson) {
  final data = jsonDecode(strJson);
  return List<Suger>.from(data.map((i) => Suger.fromMap(i)));
}

List<Suger> suger = [];
Future<List<Suger>> getdata() async {
  List<Suger> list = [];
  final response = await http.get(Uri.parse(
      "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/chart.php"));
  if (response.statusCode == 200) {
    list = fromJson(response.body);
  }
  return list;
}

List<charts.Series<Suger, String>> chartData(List<Suger> data) {
  return [
    charts.Series<Suger, String>(
        id: 'Suger',
        domainFn: (Suger s, _) => s.Days,
        measureFn: (Suger s, _) => s.SugerLevel,
        data: data)
  ];
}

class Suger {
  late final String Days;
  late final int SugerLevel;

  Suger({required this.Days, required this.SugerLevel});

  factory Suger.fromMap(Map<String, dynamic> map) {
    return Suger(Days: map["Days"], SugerLevel: int.parse(map["SugerLevel"]));
  }
}

////***************************************************** */

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
                      url: snapshot.data[i]['url']!,
                      Mealname: snapshot.data[i]['Mealname']!,
                      Mealtype: snapshot.data[i]['Mealtype']!,
                      Mealtime: snapshot.data[i]['Mealtime']!,
                      Calories: snapshot.data[i]['Calories']!,
                      carbohydrate: snapshot.data[i]['carbohydrate']!,
                      Description: snapshot.data[i]['Description']!,
                      Nutrients: snapshot.data[i]['Nutrients']!,
                      Howtoprepare: snapshot.data[i]['Howtoprepare']!);
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
