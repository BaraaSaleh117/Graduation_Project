import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/ui/connectwithscale.dart';
import 'package:graduation_projectflutter/ui/foodlistschosen.dart';
import 'package:graduation_projectflutter/ui/hba1nc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetCaloView extends StatefulWidget {
  const DetCaloView({Key? key}) : super(key: key);

  @override
  _DetCaloViewState createState() => _DetCaloViewState();
}

class _DetCaloViewState extends State<DetCaloView> {
  savePHPref(String Active) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("Active", Active);
    print(preferences.getString("Active"));
  }

  savepearpusref(String parpase) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("parpase", parpase);
    print(preferences.getString("parpase"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#FA7D82').withOpacity(0.8),
        centerTitle: true,
        title: Text("Physical Activity Level"),
      ),
      drawer: MyDrawer(),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Column(
            children: [
              Text(
                "Please select your level of physical activity",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
                width: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.9),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(.0),
                      topLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                child: ListTile(
                  title: Text(
                    "Very active",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    savePHPref("Very_Active");
                  },
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(.0),
                      topLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                child: ListTile(
                  title: Text(
                    "Energetic",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    savePHPref("Energetic");
                  },
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(.0),
                      topLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                child: ListTile(
                  title: Text(
                    "Active from time to time",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    savePHPref("Active_From");
                  },
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(.0),
                      topLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                child: ListTile(
                  title: Text(
                    "Slack",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    savePHPref("Slack");
                  },
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Select your goal",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Container(
                  height: 250,
                  padding:
                      EdgeInsets.only(left: 0, right: 0, bottom: 20, top: 40),
                  child: ListView(scrollDirection: Axis.horizontal,
                      //Start Favorate Food List
                      children: <Widget>[
                        Container(
                          height: 160,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40)),
                          ),
                          child: ListTile(
                            title: Image.asset(
                              "lib/assets/e.gif",
                            ),
                            subtitle: Container(
                                padding: EdgeInsets.only(top: 30),
                                child: Text(
                                  "Maintain weight",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                )),
                            onTap: () {
                              savepearpusref("Maintain");
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40)),
                          ),
                          height: 150,
                          width: 130,
                          child: ListTile(
                            title: Image.asset(
                              "lib/assets/k.gif",
                              fit: BoxFit.cover,
                            ),
                            subtitle: Container(
                                padding: EdgeInsets.only(top: 40),
                                child: Text(
                                  " Gain weight",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                )),
                            onTap: () {
                              savepearpusref("Gain");
                            },
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40)),
                          ),
                          child: ListTile(
                            title: Image.asset(
                              "lib/assets/g.gif",
                            ),
                            subtitle: Container(
                                padding: EdgeInsets.only(top: 30),
                                child: Text(
                                  "Lose weight",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                )),
                            onTap: () {
                              savepearpusref("Lose");
                            },
                          ),
                        ),
                      ])),
              SizedBox(
                height: 50,
                width: 500,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 40,
                onPressed: () {
                  // saveqPref(_height.text, _age.text, Drugs.text,
                  //     ChronicDiseases.text);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HbA1c()));
                },
                color: HexColor('#FA7D82').withOpacity(0.8),
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
