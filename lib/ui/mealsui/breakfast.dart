import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BreakFast extends StatefulWidget {
  const BreakFast({Key? key}) : super(key: key);

  @override
  _BreakFastState createState() => _BreakFastState();
}

class _BreakFastState extends State<BreakFast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BreakFasts"),
          backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
        ),
        drawer: MyDrawer(),
        body: GridView(
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
                        "lib/assets/BreakFastsPic/2.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                          "First option",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Egg breakfast with meat",
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
                        "lib/assets/BreakFastsPic/1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                          "Second option",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Egg with meat",
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
                        "lib/assets/BreakFastsPic/3.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                          " Third option",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Egg with meat",
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
                        "lib/assets/BreakFastsPic/4.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                          "Fourth option",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Egg with meat",
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
                        "lib/assets/BreakFastsPic/5.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                          "Fifth option",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Egg with meat",
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
                        "lib/assets/BreakFastsPic/6.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                          "Sixth option",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Egg with meat",
                          style: TextStyle(fontSize: 13, color: Colors.blue),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
