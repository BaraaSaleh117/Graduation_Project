import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';

class BreakFastss extends StatefulWidget {
  const BreakFastss({Key? key}) : super(key: key);

  @override
  _BreakFastssState createState() => _BreakFastssState();
}

class _BreakFastssState extends State<BreakFastss> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BreakFasts"),
          backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: <Widget>[
            InkWell(
              child: Container(
                height: 120,
                width: double.infinity,
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          "lib/assets/BreakFastsPic/2.jpg",
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
                                "Eggs with vegetables",
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
                                "350 kcal",
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
                                    "How to prepare  ",
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
                print("Hiii");
              },
            )
          ],
        ));
  }
}
