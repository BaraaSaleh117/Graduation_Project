import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'package:graduation_projectflutter/patientPage/ui_view/mediterranean_diet_view.dart';
import 'package:graduation_projectflutter/ui/allpatientcontentpage.dart';
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
      String Suger) async {
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

    print(preferences.getString("gender"));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 20, right: 20),
      crossAxisCount: 2,
      crossAxisSpacing: 18,
      mainAxisSpacing: 18,
      children: [
        Text(widget.Id),
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
                  widget.BloodSugerLevel);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllPatientContentPage()));
            },
            icon: Icon(
              Icons.arrow_forward_rounded,
              size: 28,
            ))
      ],
    );
  }
}
