import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'package:graduation_projectflutter/ui/DoctorUi/patientdetails.dart';
import 'package:graduation_projectflutter/ui/mealsui/details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientsList extends StatelessWidget {
  late final String Id;
  late final String ResId;
  late final String UserName;
  late final String height;
  late final String weight;
  late final String age;
  late final String Drugs;
  late final String ChronicDiseases;
  late final String BloodSugerLevel;

  String status = "Low";
  double Sugerv = 0.0;
  double ss = 0.0;
  bool msg = false;
  var List = [];
  PatientsList({
    required this.Id,
    required this.ResId,
    required this.UserName,
    required this.height,
    required this.weight,
    required this.age,
    required this.Drugs,
    required this.ChronicDiseases,
    required this.BloodSugerLevel,
  });

  detSugerLevel() {
    if (BloodSugerLevel != null) {
      Sugerv = double.parse(BloodSugerLevel);
      if (Sugerv <= 90) {
        status = "Low";
      } else if (Sugerv > 90 && Sugerv <= 120) {
        status = "Normal";
      } else if (Sugerv > 120 && Sugerv <= 160) {
        status = "High";
      } else {
        status = "Dangerous!";
      }
    }
  }

  savePref(String BloodSugerLevel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("BloodSugerLevel", BloodSugerLevel);
    String? s = preferences.getString("BloodSugerLevel");
    ss = double.parse(s!);
    if (ss > 180) {
      msg = true;
      savemsgPref(msg);
    }
  }

  savemsgPref(bool msg) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("msg", msg);
    // print(preferences.getString("msg"));
    print(msg);
  }

  @override
  Widget build(BuildContext context) {
    savePref(BloodSugerLevel);

    detSugerLevel();

    return InkWell(
      child: Container(
          decoration: BoxDecoration(
            color: FitnessAppTheme.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: const Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topRight: const Radius.circular(68.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: FitnessAppTheme.nearlyBlack.withOpacity(0.7),
                  offset: const Offset(1.1, 1.1),
                  blurRadius: 10.0),
            ],
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: Column(children: <Widget>[]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 8, bottom: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.person,
                              size: 25,
                              color: Colors.teal,
                            ),
                            Text(
                              " " + UserName,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        )
                      ],
                    )),
                    status == "Low"
                        ? Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Low ',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    letterSpacing: -0.2,
                                    color: FitnessAppTheme.darkText,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Container(
                                    height: 4,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color:
                                          HexColor('#87A0E5').withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(4.0)),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: ((80 / 1.2) * 1),
                                          height: 20,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Colors.amber,
                                              Colors.amber.withOpacity(0.5),
                                            ]),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(9.0)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    "Blood sugar level" +
                                        "\n" +
                                        '$BloodSugerLevel',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color:
                                          FitnessAppTheme.grey.withOpacity(0.9),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : status == "Normal"
                            ? Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Text(
                                          'Normal',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily:
                                                FitnessAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            letterSpacing: -0.2,
                                            color: FitnessAppTheme.darkText,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4),
                                          child: Container(
                                            height: 4,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: HexColor('#F56E98')
                                                  .withOpacity(0.2),
                                              borderRadius: const BorderRadius
                                                      .all(
                                                  const Radius.circular(4.0)),
                                            ),
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  width: ((135 / 2) * 1),
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                    gradient:
                                                        LinearGradient(colors: [
                                                      Colors.green,
                                                      Colors.green,
                                                    ]),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            const Radius
                                                                .circular(4.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 6),
                                          child: Text(
                                            "Blood sugar level" +
                                                "\n" +
                                                '$BloodSugerLevel',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily:
                                                  FitnessAppTheme.fontName,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: FitnessAppTheme.grey
                                                  .withOpacity(0.9),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : status == "High"
                                ? Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Text(
                                              'High',
                                              style: const TextStyle(
                                                fontFamily:
                                                    FitnessAppTheme.fontName,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                letterSpacing: -0.2,
                                                color: FitnessAppTheme.darkText,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 0, top: 4),
                                              child: Container(
                                                height: 4,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                  color: HexColor('#F1B440')
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(4.0)),
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      width: ((160 / 2.5) * 1),
                                                      height: 4,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              Colors.red
                                                                  .withOpacity(
                                                                      0.5),
                                                              Colors.red
                                                                  .withOpacity(
                                                                      0.5),
                                                            ]),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    4.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 6),
                                              child: Text(
                                                "Blood sugar level" +
                                                    "\n" +
                                                    '$BloodSugerLevel',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FitnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: FitnessAppTheme.grey
                                                      .withOpacity(0.9),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Text(
                                              'Dangerous!',
                                              style: const TextStyle(
                                                fontFamily:
                                                    FitnessAppTheme.fontName,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                letterSpacing: -0.2,
                                                color: FitnessAppTheme.darkText,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 0, top: 4),
                                              child: Container(
                                                height: 4,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                  color: HexColor('#F1B440')
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(4.0)),
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      width: ((160 / 2.5) * 1),
                                                      height: 4,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              Colors
                                                                  .red.shade900,
                                                              Colors
                                                                  .red.shade900,
                                                            ]),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    4.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 6),
                                              child: Text(
                                                "Blood sugar level" +
                                                    "\n" +
                                                    '$BloodSugerLevel',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FitnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: FitnessAppTheme.grey
                                                      .withOpacity(0.9),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "View Details",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (contex) {
                                    return PatientDetails(
                                      Idd: Id,
                                      ResId: ResId,
                                      UserName: UserName,
                                      height: height,
                                      weight: weight,
                                      age: age,
                                      Drugs: Drugs,
                                      ChronicDiseases: ChronicDiseases,
                                      BloodSugerLevel: BloodSugerLevel,
                                    );
                                  }));
                                },
                                icon: Icon(
                                  Icons.contact_page_outlined,
                                  size: 30,
                                )),
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          )),
      onTap: () {},
    );
  }
}
