import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

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
        drawer: MyDrawer(),
        body: ListView(
          children: <Widget>[
            Container(
                height: 300,
                child: GridTile(
                  child: Image.asset("lib/assets/BreakFastsPic/2.jpg"),
                  footer: Container(
                    height: 50,
                    color: Colors.black.withOpacity(0.4),
                    child: Text(
                      "400 Kcal ",
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
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Eggs whith Vegitable",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
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
                              "10:00 Am",
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
                          text:
                              "This meal contains many benefits, the most important of which is reducing the level of sugar in the blood, and adhering to it helps in maintaining a normal weight",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        )
                      ])),
                    ),
                    Container(
                        width: double.infinity,
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 30, left: 6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "How to prepare :  ",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "♦ Put half a cup of oil",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "♦fry the eggs",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "♦ Put two tomatoes",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 60,
                    )
                  ],
                )),
          ],
        ));
  }
}
