import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
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

  static List<charts.Series<Suger, String>> chartData(List<Suger> data) {
    return [
      charts.Series<Suger, String>(
          id: 'Suger',
          domainFn: (Suger s, _) => s.Days,
          measureFn: (Suger s, _) => s.SugerLevel,
          data: data)
    ];
  }

  @override
  void initState() {
    getdata().then((value) => suger = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          child: charts.BarChart(
            chartData(suger),
            animate: true,
          ),
        ),
      ),
    );
  }
}

class Suger {
  late final String Days;
  late final int SugerLevel;

  Suger({required this.Days, required this.SugerLevel});

  factory Suger.fromMap(Map<String, dynamic> map) {
    return Suger(Days: map["Days"], SugerLevel: int.parse(map["SugerLevel"]));
  }
}
