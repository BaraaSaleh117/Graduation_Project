import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/models/resolution.dart';
import 'package:graduation_projectflutter/ui/detcalview.dart';
import 'package:graduation_projectflutter/ui/foodlistschosen.dart';
import 'package:graduation_projectflutter/ui/resolution_a.dart';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/models/resolution.dart';

import 'package:shared_preferences/shared_preferences.dart';

class qusetions extends StatefulWidget {
  const qusetions({Key? key}) : super(key: key);

  @override
  _qusetionsState createState() => _qusetionsState();
}

TextEditingController _height = TextEditingController();
TextEditingController _age = TextEditingController();
TextEditingController Drugs = TextEditingController();
TextEditingController ChronicDiseases = TextEditingController();

class _qusetionsState extends State<qusetions> {
  var username;
  bool isSignIn = false;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username = preferences.getString("username");
    if (username != null) {
      setState(() {
        username = preferences.getString("username");
        isSignIn = true;
      });
    }
    print(username);
  }

  @override
  initState() {
    getPref();
    super.initState();
  }

  saveqPref(
      String Height, String Age, String Drugs, String ChronicDiseases) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("Height", Height);
    preferences.setString("aage", Age);
    preferences.setString("Drugs", Drugs);
    preferences.setString("ChronicDiseases", ChronicDiseases);
    print(preferences.getString("Height"));
    print(preferences.getString("aage"));
    print(preferences.getString("Drugs"));
    print(preferences.getString("ChronicDiseases"));
  }

  savePref(String gender) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("Gen", gender);
    print(preferences.getString("Gen"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: HexColor('#FA7D82').withOpacity(0.8),
          centerTitle: true,
          title: Text("Questionnaire Page"),
        ),
        body: ListView(
          children: [
            Container(
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //       image: AssetImage("lib/assets/21.PNG"), fit: BoxFit.cover),
              // ),
              padding: const EdgeInsets.only(top: 20.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    isSignIn
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Welcome " + username,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 29,
                                    color: Colors.black,
                                    shadows: [
                                      Shadow(
                                          color: Colors.red.shade300,
                                          blurRadius: 7.0,
                                          offset: Offset(2.0, 4.0))
                                    ]),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        : Text(""),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset("lib/assets/Aq.gif"),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "We are pleased to know some information about you",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 29,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                                color: Colors.pink,
                                blurRadius: 3.0,
                                offset: Offset(1.0, 1.0))
                          ]),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10.0,
                      width: 30,
                    ),
                    Container(
                      color: HexColor('#FA7D82').withOpacity(0.5),
                      width: double.infinity,
                      height: 5,
                    ),
                    const SizedBox(
                      height: 30.0,
                      width: 30,
                    ),
                    const Text(
                      "Enter your height",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                        controller: _height,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Text(
                      "Enter your age",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                        controller: _age,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "Select your Gender ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.male,
                                  size: 60,
                                  color: Colors.blue,
                                ),
                              ),
                              onTap: () {
                                savePref("male");
                              },
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Column(
                          children: [
                            InkWell(
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.female,
                                  size: 60,
                                  color: Colors.pink,
                                ),
                              ),
                              onTap: () {
                                savePref("female");
                              },
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.3),
                      width: double.infinity,
                      height: 2,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      " If you have any chronic diseases, please write it here ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    TextField(
                        controller: ChronicDiseases,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "Enter the names of the drugs if you use",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                        controller: Drugs,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 280,
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 40,
                        onPressed: () {
                          saveqPref(_height.text, _age.text, Drugs.text,
                              ChronicDiseases.text);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetCaloView()));
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
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
