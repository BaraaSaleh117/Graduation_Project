import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';

class Details extends StatefulWidget {
  late final String Idd;
  late final String url;
  late final String Mealnamed;
  late final String Mealtyped;
  late final String Mealtimed;
  late final String Caloriesd;
  late final String carbohydrate;
  late final String Descriptiond;
  late final String Nutrients;
  late final String Howtoprepare;

  Details(
      {required this.Idd,
      required this.url,
      required this.Mealnamed,
      required this.Mealtyped,
      required this.Mealtimed,
      required this.Caloriesd,
      required this.carbohydrate,
      required this.Descriptiond,
      required this.Nutrients,
      required this.Howtoprepare});

  @override
  _Details createState() => _Details();
}

class _Details extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#FA7D82').withOpacity(0.5),
          title: Text("Meal details"),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
                height: 300,
                child: GridTile(
                  child: Image.asset(
                    widget.url,
                    fit: BoxFit.cover,
                  ),
                  footer: Container(
                      height: 50,
                      color: Colors.black.withOpacity(0.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                widget.Mealnamed,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.amber),
                              ),
                            ],
                          ),
                          Text(
                            "Total calories : " + widget.Caloriesd + " Kcal",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      )),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: FitnessAppTheme.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(68.0),
                    bottomLeft: const Radius.circular(68.0),
                    bottomRight: Radius.circular(0.0),
                    topRight: const Radius.circular(0.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: HexColor('#FA7D82').withOpacity(0.8),
                      offset: const Offset(1.8, 1.9),
                      blurRadius: 18.0),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: widget.Descriptiond,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                )
              ])),
            ),
            Container(
                padding: EdgeInsets.only(top: 20, left: 6),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_forward,
                          size: 40,
                          color: Colors.red,
                        ),
                        Text(
                          " Carbs: " + widget.carbohydrate + " Kcal",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: FitnessAppTheme.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(0.0),
                              bottomLeft: const Radius.circular(0.0),
                              bottomRight: Radius.circular(68.0),
                              topRight: const Radius.circular(68.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: FitnessAppTheme.grey.withOpacity(0.8),
                                offset: const Offset(1.1, 1.1),
                                blurRadius: 18.0),
                          ],
                        ),
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.access_alarms_sharp,
                              size: 40,
                              color: Colors.deepPurpleAccent,
                            ),
                            Text(
                              " " + widget.Mealtimed,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: FitnessAppTheme.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(68.0),
                            bottomLeft: const Radius.circular(68.0),
                            bottomRight: Radius.circular(0.0),
                            topRight: const Radius.circular(0.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: HexColor('#FA7D82').withOpacity(0.8),
                              offset: const Offset(1.8, 1.9),
                              blurRadius: 18.0),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 25, right: 25),
                      child: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: "Nutrients :" + "\n" + "\n",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: widget.Nutrients,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        )
                      ])),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: FitnessAppTheme.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(0.0),
                            bottomLeft: const Radius.circular(0.0),
                            bottomRight: Radius.circular(68.0),
                            topRight: const Radius.circular(68.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey,
                              offset: const Offset(1.8, 1.9),
                              blurRadius: 18.0),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 20, bottom: 20, left: 16),
                      child: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: "Meal ingredients and preparation method : " +
                              "\n" +
                              "\n",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: widget.Howtoprepare,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        )
                      ])),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                )),
          ],
        ));
  }
}
