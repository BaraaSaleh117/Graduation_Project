import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'package:graduation_projectflutter/ui/mealsui/details.dart';

class LunchsList extends StatelessWidget {
  late final String Id;
  late final String url;
  late final String Mealname;
  late final String Mealtype;
  late final String Mealtime;
  late final String Calories;
  late final String carbohydrate;
  late final String Description;
  late final String Nutrients;
  late final String Howtoprepare;

  LunchsList(
      {required this.Id,
      required this.url,
      required this.Mealname,
      required this.Mealtype,
      required this.Mealtime,
      required this.Calories,
      required this.carbohydrate,
      required this.Description,
      required this.Nutrients,
      required this.Howtoprepare});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 120,
        width: double.infinity,
        child: Card(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.asset(
                  url,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topCenter,
                  height: 120,
                  child: Column(
                    children: <Widget>[
                      Text(
                        Mealname,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        Calories + " Kcal",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Show Details",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                          Icon(
                            Icons.dining_outlined,
                            color: Colors.teal,
                            size: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: FitnessAppTheme.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: const Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: const Radius.circular(60.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: FitnessAppTheme.nearlyBlue.withOpacity(0.7),
                offset: const Offset(1.1, 7.1),
                blurRadius: 10.0),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (contex) {
          return Details(
            Idd: Id,
            url: url,
            Mealnamed: Mealname,
            Mealtyped: Mealtype,
            Mealtimed: Mealtime,
            Caloriesd: Calories,
            carbohydrate: carbohydrate,
            Descriptiond: Description,
            Nutrients: Nutrients,
            Howtoprepare: Howtoprepare,
          );
        }));
      },
    );
  }
}
