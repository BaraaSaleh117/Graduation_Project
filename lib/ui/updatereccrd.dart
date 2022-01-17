import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/models/resolution.dart';
import 'package:graduation_projectflutter/ui/detcalview.dart';
import 'package:graduation_projectflutter/ui/foodlistschosen.dart';
import 'package:graduation_projectflutter/ui/patientui1.dart';
import 'package:graduation_projectflutter/ui/resolution_a.dart';
import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/models/resolution.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UpdateRecord extends StatefulWidget {
  const UpdateRecord({Key? key}) : super(key: key);

  @override
  _UpdateRecordState createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {
  TextEditingController _Weight = new TextEditingController();
  TextEditingController _Drugs = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _ChronicDiseases = TextEditingController();
  var weightt;
  var Height;
  var Age;
  var Drugs;
  var ChronicDiseases;
  var Sugerb;
  var Weight;
  var Id;
  var Active;
  late String Sucomments;
  var parpase;

  Future getBreakFasts() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/PostData/UpdateInfo.php";

    var data = {
      "ResId": Id,
      "age": _age.text,
      "weight": _Weight.text,
      "Drugs": _Drugs.text,
      "ChronicDiseases": _ChronicDiseases.text,
    };
    var res = await http.post(Uri.parse(theUrl),
        body: data, headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    return responceBody;
  }

  Future getqPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Id = preferences.getString("Id");
      Height = preferences.getString("Height");
      weightt = preferences.getString("weightt");
      Age = preferences.getString("aage");
      Drugs = preferences.getString("Drugs");
      ChronicDiseases = preferences.getString("ChronicDiseases");
      Active = preferences.getString("Active");
      parpase = preferences.getString("parpase");
      Sugerb = preferences.getString("Sugerb");
    });
    print(Id + Height + Age + Drugs + ChronicDiseases);
  }

  @override
  initState() {
    getqPref();

    super.initState();
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
        appBar: AppBar(
          backgroundColor: HexColor('#FA7D82').withOpacity(0.8),
          centerTitle: true,
          title: Text("Update Record Informations"),
        ),
        body: ListView(
          children: [
            Container(
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //       image: AssetImage("lib/assets/21.PNG"), fit: BoxFit.cover),
              // ),
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                      "Weight",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                        controller: _Weight,
                        onChanged: null,
                        decoration: InputDecoration(
                            labelText: weightt,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Text(
                      "age",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                        controller: _age,
                        onChanged: null,
                        decoration: InputDecoration(
                            labelText: Age,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const Text(
                      "Chronic diseases",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                        controller: _ChronicDiseases,
                        onChanged: (value) {
                          _ChronicDiseases.value = ChronicDiseases;
                        },
                        decoration: InputDecoration(
                            labelText: ChronicDiseases,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "Drugs",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                        controller: _Drugs,
                        onChanged: (value) {
                          _Drugs.value = Drugs;
                        },
                        decoration: InputDecoration(
                            labelText: Drugs,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
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
                      color: HexColor('#FA7D82').withOpacity(0.5),
                      width: double.infinity,
                      height: 5,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Update your level of physical activity",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      padding:
                          EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          // savePHPref("Very_Active");
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    Container(
                      width: 150,
                      height: 50,
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          // savePHPref("Energetic");
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                      width: 160,
                      height: 60,
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          // savePHPref("Active_From");
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    Container(
                      width: 150,
                      height: 50,
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          // savePHPref("Slack");
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      color: HexColor('#FA7D82').withOpacity(0.5),
                      width: double.infinity,
                      height: 5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Update your goal",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                        height: 250,
                        padding: EdgeInsets.only(
                            left: 0, right: 0, bottom: 20, top: 40),
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
                                    "lib/assets/m.gif",
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
                                    // savepearpusref("Maintain");
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
                                    //  savepearpusref("Gain");
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
                                    //  savepearpusref("Lose");
                                  },
                                ),
                              ),
                            ])),
                    SizedBox(
                      height: 50,
                      width: 500,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      color: HexColor('#FA7D82').withOpacity(0.5),
                      width: double.infinity,
                      height: 5,
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
                          getBreakFasts();
                          print("Updated Succssfully");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PatientUi1()));
                        },
                        color: HexColor('#FA7D82').withOpacity(0.8),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Update",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 500,
                    ),
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
