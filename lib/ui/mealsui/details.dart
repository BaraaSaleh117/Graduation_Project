import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';

class Details extends StatefulWidget {
  late final String Idd;
  late final String url;
  late final String Mealnamed;
  late final String Mealtyped;
  late final String Mealtimed;
  late final String Caloriesd;
  late final String Descriptiond;

  Details(
      {required this.Idd,
      required this.url,
      required this.Mealnamed,
      required this.Mealtyped,
      required this.Mealtimed,
      required this.Caloriesd,
      required this.Descriptiond});

  @override
  _Details createState() => _Details();
}

class _Details extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
        ),
        body: ListView(
          children: <Widget>[
            Container(
                height: 300,
                child: GridTile(
                  child: Image.asset(
                    widget.url,
                    fit: BoxFit.fill,
                  ),
                  footer: Container(
                    height: 50,
                    color: Colors.black.withOpacity(0.4),
                    child: Text(
                      widget.Caloriesd + " Kcal",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                )),
            Container(
                padding: EdgeInsets.only(top: 20, left: 6),
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(10),
                        height: 60,
                        color: Colors.teal.withOpacity(0.4),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Meal name : ",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              widget.Mealnamed,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red.withOpacity(0.7)),
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(top: 20, left: 16),
                        height: 60,
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Meal time : ",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              widget.Mealtimed,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ],
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 20, bottom: 20, left: 16),
                      color: Colors.teal.withOpacity(0.4),
                      child: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: "Description : ",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: widget.Descriptiond,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        )
                      ])),
                    ),
                    SizedBox(
                      height: 60,
                    )
                  ],
                )),
          ],
        ));
  }
}
