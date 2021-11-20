import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/models/resolution.dart';
import 'package:graduation_projectflutter/ui/resolution_a.dart';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/models/resolution.dart';
import 'package:graduation_projectflutter/ui/resolution_list.dart';
import 'package:http/http.dart' as http;

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
  @override
  Widget build(BuildContext context) {
    _height.text = resolution.height;
    _age.text = resolution.age;
    Drugs.text = resolution.Drugs;
    ChronicDiseases.text = resolution.ChronicDiseases;

    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/H.png"), fit: BoxFit.cover),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "We are pleased to know some information about you",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                    width: 30,
                  ),
                  const Text(
                    "Enter your height",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
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
                      fontSize: 18,
                      color: Colors.black,
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
                      fontSize: 18,
                      color: Colors.black,
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
                      fontSize: 18,
                      color: Colors.black,
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
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 40,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResolutionA()));
                      //   saveResolution();
                      //  print("/////////////");
                    },
                    color: Colors.teal,
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