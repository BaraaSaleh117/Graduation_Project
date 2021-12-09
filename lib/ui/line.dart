import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Line extends StatefulWidget {
  const Line({Key? key}) : super(key: key);

  @override
  _LineState createState() => _LineState();
}

class _LineState extends State<Line> {
  List<SalesData> _chartData = [];
  @override
  void initState() {
    _chartData = getChartData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
            width: 500,
            height: 280,
            child: Scaffold(
                body: SfCartesianChart(
              title: ChartTitle(text: 'analysis'),
              //legend: Legend(isVisible: true),
              series: <ChartSeries>[
                LineSeries<SalesData, double>(
                    dataSource: _chartData,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    dataLabelSettings: DataLabelSettings(isVisible: true)),
              ],
              primaryXAxis:
                  NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
            )))
      ],
    ));
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
