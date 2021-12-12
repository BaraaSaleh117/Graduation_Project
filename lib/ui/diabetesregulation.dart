import 'dart:convert';
import 'dart:developer';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'package:graduation_projectflutter/patientPage/ui_view/mediterranean_diet_view.dart';
import 'package:graduation_projectflutter/ui/mealsui/breakfastlistview.dart';
import 'package:graduation_projectflutter/ui/mealsui/dinner.dart';
import 'package:graduation_projectflutter/ui/mealsui/snack.dart';
import 'package:graduation_projectflutter/ui/resolution_a.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:http/http.dart' as http;
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
List<SalesData> _chartData = [];
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

class _DiabetesRegState extends State<DiabetesReg> {
  getSugerPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Sugerb = preferences.getString("Sugerb");
    });
    print("Your blood sugar level is : " + Sugerb);
  }

  detSugerLevel(Sugerb) {
    double Sugerv = double.parse(Sugerb);
    if (Sugerv <= 90) {
      Sucomments = "Low";
    } else if (Sugerv > 90 && Sugerv <= 120) {
      Sucomments = "Normal";
    } else if (Sugerv > 120 && Sugerv <= 160) {
      Sucomments = "High";
    } else {
      Sucomments = "Very dangerous";
    }
  }

  @override
  void initState() {
    getData();
    getSugerPref();

    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    lastcheck = (DateFormat('EEEE , h:mm a').format(date));
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
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Important events ",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
            ),
            Container(
              child: SfCalendar(
                view: CalendarView.week,
                firstDayOfWeek: 6,
                // initialDisplayDate: DateTime(2021, 12, 09, 08, 30),
                // initialSelectedDate: DateTime(2021, 12, 09, 08, 30),
                dataSource: MeetingDataSource(getAppointments()),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(20),
                child: const Text("Blood Sugar Status",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal))),
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
                                    const Text(
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
                                "Your Status is : " + Sucomments,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                  color: FitnessAppTheme.nearlyBlack
                                      .withOpacity(0.7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )),
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
            Container(
              decoration: BoxDecoration(
                color: FitnessAppTheme.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: const Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: const Radius.circular(6.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: FitnessAppTheme.grey.withOpacity(0.3),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 4.0),
                ],
              ),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Here we provide you with some healthy meals ',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Text(
                                  'based on your health condition',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.orange),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 6, bottom: 20),
                                child: Text(
                                  'Help us maintain your health, to achieve the desired goal',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
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
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "Chart",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
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
                width: 500,
                height: 250,
                child: Scaffold(
                    body: SfCartesianChart(
                  title: ChartTitle(text: ''),
                  //legend: Legend(isVisible: true),
                  series: <ChartSeries>[
                    LineSeries<SalesData, double>(
                        dataSource: _chartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        color: HexColor('#5C5EDD').withOpacity(0.9),
                        dataLabelSettings: DataLabelSettings(isVisible: true)),
                  ],
                  primaryXAxis:
                      NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                ))),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

List<SalesData> getChartData() {
  final List<SalesData> chartData = [
    SalesData(1, 120),
    SalesData(2, 140),
    SalesData(3, 180),
    SalesData(4, 140),
    SalesData(5, 100),
    SalesData(6, 120),
    SalesData(7, 150),
  ];
  return chartData;
}

class SalesData {
  final double year;
  final double sales;
  SalesData(this.year, this.sales);
}

List<Appointment> getAppointments() {
  List<Appointment> meeting = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime starTime =
      DateTime(today.year, today.month, today.day, 3, 0, 0);
  final DateTime endtime = starTime.add(const Duration(hours: 1));

  meeting.add(Appointment(
      startTime: starTime,
      endTime: endtime,
      subject: "Confernce",
      color: Colors.red.withOpacity(0.4),
      recurrenceRule: 'FREQ=DAILY;COUNT=10'));

  return meeting;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
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
