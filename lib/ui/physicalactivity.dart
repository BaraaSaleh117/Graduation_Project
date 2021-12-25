import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';

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
        ),
        body: Container(
            child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            InkWell(
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
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
                          "Aqla",
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
              onTap: () {},
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
              onTap: () {},
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "lib/assets/fitness_app/runner.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                          "Jogging",
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
              onTap: () {},
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
              onTap: () {},
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "lib/assets/fitness_app/38.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                          "jumping",
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
              onTap: () {},
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
