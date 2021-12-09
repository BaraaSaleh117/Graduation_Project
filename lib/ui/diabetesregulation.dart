import 'dart:convert';
import 'dart:developer';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DiabetesReg extends StatefulWidget {
  const DiabetesReg({Key? key}) : super(key: key);

  @override
  _DiabetesRegState createState() => _DiabetesRegState();
}

var ListSearch = [];
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
  @override
  void initState() {
    getData();
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Diations",
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
              child: const Text(
                "Chart",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
            ),
            Container(
                width: 500,
                height: 250,
                child: Scaffold(
                    body: SfCartesianChart(
                  title: ChartTitle(text: 'analysis'),
                  //legend: Legend(isVisible: true),
                  series: <ChartSeries>[
                    LineSeries<SalesData, double>(
                        dataSource: _chartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        color: HexColor('#5C5EDD').withOpacity(0.5),
                        dataLabelSettings: DataLabelSettings(isVisible: true)),
                  ],
                  primaryXAxis:
                      NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                ))),
            Container(
                padding: const EdgeInsets.all(20),
                child: const Text("Blood Suger Levels",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal))),
          ],
        ),
      ),
    );
  }
}

List<SalesData> getChartData() {
  final List<SalesData> chartData = [
    SalesData(2017, 25),
    SalesData(2018, 26),
    SalesData(2019, 20),
    SalesData(2020, 6),
    SalesData(2021, 19),
    SalesData(2022, 3),
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
