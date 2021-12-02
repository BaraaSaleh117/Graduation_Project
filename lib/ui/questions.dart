import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/models/resolution.dart';
import 'package:graduation_projectflutter/ui/foodlistschosen.dart';
import 'package:graduation_projectflutter/ui/resolution_a.dart';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/models/resolution.dart';
import 'package:graduation_projectflutter/ui/resolution_list.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class qusetions extends StatefulWidget {
  const qusetions({Key? key}) : super(key: key);

  @override
  _qusetionsState createState() => _qusetionsState();
}

PatientResolution resolution = new PatientResolution(
    id: "",
    height: "height",
    age: "age",
    Drugs: "Drugs",
    ChronicDiseases: "ChronicDiseases",
    PatientRID: "PatientRID");

String theUrl =
    'http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getResolution.php';

Future<bool> PostResolution(PatientResolution item) async {
  var myResolution = item.toJson();
  var ResolutionBody = json.encode(myResolution);
  var res = await http.post(Uri.parse(Uri.encodeFull(theUrl)),
      headers: {"Accept": "application/json"}, body: ResolutionBody);
  return Future.value(res.statusCode == 200 ? true : false);
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
    preferences.setString("Age", Age);
    preferences.setString("Drugs", Drugs);
    preferences.setString("ChronicDiseases", ChronicDiseases);
    print(preferences.getString("Height"));
    print(preferences.getString("Age"));
    print(preferences.getString("Drugs"));
    print(preferences.getString("ChronicDiseases"));
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
          backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
          centerTitle: true,
          title: Text("Questionnaire Page"),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/Q.jpg"), fit: BoxFit.cover),
            ),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  isSignIn
                      ? Text(
                          "Welcome " + username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 29,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                    color: Colors.red.shade300,
                                    blurRadius: 7.0,
                                    offset: Offset(2.0, 4.0))
                              ]),
                          textAlign: TextAlign.center,
                        )
                      : Text(""),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "We are pleased to know some information about you",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 29,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              color: Colors.teal,
                              blurRadius: 7.0,
                              offset: Offset(2.0, 4.0))
                        ]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50.0,
                    width: 30,
                  ),
                  const Text(
                    "Enter your height",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextField(
                    controller: _height,
                    onChanged: (value) => updateheight(),
                  ),
                  const Text(
                    "Enter your age",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextField(
                    controller: _age,
                    onChanged: (value) => updateage(),
                  ),
                  const Text(
                    "If you have any chronic diseases, please write it here ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  TextField(
                    controller: ChronicDiseases,
                    onChanged: (value) => updatechronicdiseases(),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Enter the names of the drugs if you use",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextField(
                    controller: Drugs,
                    onChanged: (value) => updatedrugs(),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 40,
                    onPressed: () {
                      saveqPref(_height.text, _age.text, Drugs.text,
                          ChronicDiseases.text);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodListChosen()));
                    },
                    color: Colors.black.withOpacity(0.4),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void saveResolution() async {
    var saveResponse = await PostResolution(resolution);
    saveResponse == true ? Navigator.pop(context, true) : null;
  }

  void updateheight() {
    resolution.height = _height.text;
  }

  void updateage() {
    resolution.age = _age.text;
  }

  void updatechronicdiseases() {
    resolution.ChronicDiseases = ChronicDiseases.text;
  }

  void updatedrugs() {
    resolution.Drugs = Drugs.text;
  }
}
