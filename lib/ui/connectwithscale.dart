import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_home_screen.dart';
import 'package:graduation_projectflutter/scale/scaleapp.dart';
import 'package:graduation_projectflutter/ui/patientUi.dart';
import 'package:graduation_projectflutter/ui/resolution_a.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConnectScale extends StatefulWidget {
  const ConnectScale({Key? key}) : super(key: key);

  @override
  _ConnectScaleState createState() => _ConnectScaleState();
}

class _ConnectScaleState extends State<ConnectScale> {
  TextEditingController weightc = TextEditingController();

  savePrefWeight(String weightt) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("weightt", weightt);
    print(preferences.getString("weightt"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: const Text(
            "Weight Scale Page",
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: HexColor('#FA7D82').withOpacity(0.9),
          elevation: 6,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/xa.png"), fit: BoxFit.cover),
            ),
            padding: const EdgeInsets.all(40.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Smart Scale",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: HexColor('#FA7D82').withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "You Can enter your weight manually here",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  TextFormField(
                    controller: weightc,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    autofocus: false,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const SizedBox(
                    height: 90.0,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Text(
                    " Or you can enter it Via Bluetooth from here",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 40,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ScaleApp()));
                    },
                    color: Colors.blue,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      "Bluetooth ",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 40,
                    onPressed: () {
                      if (weightc.text != null || weightc.text != "") {
                        savePrefWeight(weightc.text);
                      }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResolutionA()));
                    },
                    color: HexColor('#FA7D82').withOpacity(0.9),
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
}
