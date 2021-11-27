// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';

class BreakFastss extends StatefulWidget {
  const BreakFastss({Key? key}) : super(key: key);

  @override
  _BreakFastssState createState() => _BreakFastssState();
}

class _BreakFastssState extends State<BreakFastss> {
  var breakfastslist = [
    {
      'Id': '1',
      'Mealname': 'Eggs with vegetables',
      'Mealtype': 'BreakFast',
      'Mealtime': '10:00 Am',
      'Calories': '400 Kcal',
      'Description': 'Eggs with vegetables good breakfastn',
    },
    {
      'Id': '2',
      'Mealname': 'vegetables',
      'Mealtype': 'BreakFast',
      'Mealtime': '9:00 Am',
      'Calories': '390 Kcal',
      'Description': 'Eggs good breakfastn',
    },
    {
      'Id': '3',
      'Mealname': 'Milk',
      'Mealtype': 'BreakFast',
      'Mealtime': '5:00 Am',
      'Calories': '700 Kcal',
      'Description': 'Milk good breakfastn',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("               BreakFasts"),
          backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
        ),
        drawer: MyDrawer(),
        body: ListView.builder(
          itemCount: breakfastslist.length,
          itemBuilder: (context, i) {
            return mealsList(
                Id: breakfastslist[i]['Id']!,
                Mealname: breakfastslist[i]['Mealname']!,
                Mealtype: breakfastslist[i]['Mealtype']!,
                Mealtime: breakfastslist[i]['Mealtime']!,
                Calories: breakfastslist[i]['Calories']!,
                Description: breakfastslist[i]['Description']!);
          },
        ));
  }
}
