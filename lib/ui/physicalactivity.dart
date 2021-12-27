import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/ui/physicalactivitypages/aqla.dart';
import 'package:graduation_projectflutter/ui/physicalactivitypages/bikeriding.dart';
import 'package:graduation_projectflutter/ui/physicalactivitypages/cardio.dart';
import 'package:graduation_projectflutter/ui/physicalactivitypages/pushup.dart';
import 'package:graduation_projectflutter/ui/physicalactivitypages/skippingrope.dart';
import 'package:graduation_projectflutter/ui/physicalactivitypages/stomach.dart';
import 'package:url_launcher/url_launcher.dart';

class PhysicalActivity extends StatefulWidget {
  const PhysicalActivity({Key? key}) : super(key: key);

  @override
  _PhysicalActivityState createState() => _PhysicalActivityState();
}

class _PhysicalActivityState extends State<PhysicalActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Physical Activity"),
          backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
          centerTitle: true,
        ),
        body: Container(
            child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SkippingRope()));
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "lib/assets/fitness_app/34.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                          "Skipping rope",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "",
                          style: TextStyle(fontSize: 13, color: Colors.blue),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cardio()));
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "lib/assets/fitness_app/5.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                          "cardio",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "",
                          style: TextStyle(fontSize: 13, color: Colors.blue),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Aqla()));
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "lib/assets/fitness_app/35.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                          "Pull up",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "",
                          style: TextStyle(fontSize: 13, color: Colors.blue),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PushUp()));
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "lib/assets/fitness_app/36.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                          "Push up",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "",
                          style: TextStyle(fontSize: 13, color: Colors.blue),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Stomach()));
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "lib/assets/fitness_app/22.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                          "Stomach exercises",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "",
                          style: TextStyle(fontSize: 13, color: Colors.blue),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BikeRiding()));
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "lib/assets/fitness_app/39.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                          "Bike riding",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "",
                          style: TextStyle(fontSize: 13, color: Colors.blue),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
