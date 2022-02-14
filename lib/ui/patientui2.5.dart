import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'package:graduation_projectflutter/patientPage/ui_view/mediterranean_diet_view.dart';
import 'package:graduation_projectflutter/ui/allpatientcontentpage.dart';
import 'package:graduation_projectflutter/ui/updatereccrd.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListPatients extends StatefulWidget {
  late final String Id;
  late final String UserName;
  late final String height;
  late final String weight;
  late final String gender;
  late final String age;
  late final String Drugs;
  late final String ChronicDiseases;
  late final String BloodSugerLevel;
  late final String Active;
  late final String parpase;

  ListPatients({
    required this.Id,
    required this.UserName,
    required this.height,
    required this.weight,
    required this.gender,
    required this.age,
    required this.Drugs,
    required this.ChronicDiseases,
    required this.BloodSugerLevel,
    required this.Active,
    required this.parpase,
  });

  @override
  _ListPatientsState createState() => _ListPatientsState();
}

class _ListPatientsState extends State<ListPatients> {
  saveqPref(
    String Id,
    String UserName,
    String Height,
    String Weight,
    String gender,
    String Age,
    String Drugs,
    String ChronicDiseases,
    String Suger,
    String Active,
    String parpase,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("Id", Id);
    preferences.setString("username", UserName);
    preferences.setString("Height", Height);
    preferences.setString("weightt", Weight);
    preferences.setString("gender", gender);
    preferences.setString("aage", Age);
    preferences.setString("Drugs", Drugs);
    preferences.setString("ChronicDiseases", ChronicDiseases);
    preferences.setString("Sugerb", Suger);
    preferences.setString("Active", Active);
    preferences.setString("parpase", parpase);

    print(preferences.getString("gender"));
  }

  @override
  Widget build(BuildContext context) {
    print(widget.UserName + " ID is : " + widget.Id.toString());
    return GridView.count(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 20, right: 20, top: 2, bottom: 0),
      crossAxisCount: 1,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: [
        ListView(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: FitnessAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      bottomLeft: const Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topRight: const Radius.circular(0.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: HexColor('#FA7D82').withOpacity(0.8),
                        offset: const Offset(1.8, 1.9),
                        blurRadius: 18.0),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
                child: Text(
                  "Height : " + widget.height + " cm",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            Container(
                decoration: BoxDecoration(
                  color: FitnessAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      bottomLeft: const Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topRight: const Radius.circular(0.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: HexColor('#FA7D82').withOpacity(0.8),
                        offset: const Offset(1.8, 1.9),
                        blurRadius: 18.0),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
                child: Text(
                  "Weight : " + widget.weight + " Kg",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            Container(
                decoration: BoxDecoration(
                  color: FitnessAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      bottomLeft: const Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topRight: const Radius.circular(0.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: HexColor('#FA7D82').withOpacity(0.8),
                        offset: const Offset(1.8, 1.9),
                        blurRadius: 18.0),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
                child: Text(
                  "Age : " + widget.age + " year",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            Container(
                decoration: BoxDecoration(
                  color: FitnessAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      bottomLeft: const Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topRight: const Radius.circular(0.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: HexColor('#FA7D82').withOpacity(0.8),
                        offset: const Offset(1.8, 1.9),
                        blurRadius: 18.0),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
                child: Text(
                  "Gender : " + widget.gender,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            Container(
                decoration: BoxDecoration(
                  color: FitnessAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      bottomLeft: const Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topRight: const Radius.circular(0.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: HexColor('#FA7D82').withOpacity(0.8),
                        offset: const Offset(1.8, 1.9),
                        blurRadius: 18.0),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
                child: Text(
                  "ChronicDiseases : " + "\n" + widget.ChronicDiseases,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            Container(
                decoration: BoxDecoration(
                  color: FitnessAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      bottomLeft: const Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topRight: const Radius.circular(0.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: HexColor('#FA7D82').withOpacity(0.8),
                        offset: const Offset(1.8, 1.9),
                        blurRadius: 18.0),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
                child: Text(
                  "Drugs : " + "\n" + widget.Drugs,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
        Container(
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assets/gw2.jpg"), fit: BoxFit.fill),
          ),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: FitnessAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(68.0),
                      bottomLeft: const Radius.circular(68.0),
                      bottomRight: Radius.circular(68.0),
                      topRight: const Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: HexColor('#FA7D82').withOpacity(0.8),
                        offset: const Offset(1.8, 1.9),
                        blurRadius: 18.0),
                  ],
                ),
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          saveqPref(
                              widget.Id.toString(),
                              widget.UserName,
                              widget.height,
                              widget.weight,
                              widget.gender,
                              widget.age,
                              widget.Drugs,
                              widget.ChronicDiseases,
                              widget.BloodSugerLevel,
                              widget.Active,
                              widget.parpase);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateRecord()));
                        },
                        icon: Icon(
                          Icons.edit,
                          size: 35,
                          color: Colors.red,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Update Form",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: FitnessAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(68.0),
                      bottomLeft: const Radius.circular(68.0),
                      bottomRight: Radius.circular(68.0),
                      topRight: const Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: HexColor('#FA7D82').withOpacity(0.8),
                        offset: const Offset(1.8, 1.9),
                        blurRadius: 18.0),
                  ],
                ),
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          saveqPref(
                              widget.Id,
                              widget.UserName,
                              widget.height,
                              widget.weight,
                              widget.gender,
                              widget.age,
                              widget.Drugs,
                              widget.ChronicDiseases,
                              widget.BloodSugerLevel,
                              widget.Active,
                              widget.parpase);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AllPatientContentPage()));
                        },
                        icon: Icon(
                          Icons.double_arrow_sharp,
                          size: 40,
                          color: Colors.red,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
