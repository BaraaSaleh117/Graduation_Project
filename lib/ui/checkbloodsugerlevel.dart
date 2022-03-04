import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/ui/allpatientcontentpage.dart';
import 'package:graduation_projectflutter/ui/connectwithscale.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckBloodSuger extends StatefulWidget {
  const CheckBloodSuger({Key? key}) : super(key: key);

  @override
  _CheckBloodSugerState createState() => _CheckBloodSugerState();
}

TextEditingController Suger = TextEditingController();

class _CheckBloodSugerState extends State<CheckBloodSuger> {
  savePrefSuger(String Sugerb) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("Sugerb", Sugerb);
    print(preferences.getString("Sugerb"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Blood Sugar Measurement Page",
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
                  image: AssetImage("lib/assets/pe.jpg"), fit: BoxFit.fill),
            ),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: const EdgeInsets.all(40.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 5, left: 20, right: 10),
                    child: Text(
                      "Please measure your blood sugar level and then enter the value here ",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 2,
                          letterSpacing: 1,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                      controller: Suger,
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: "Ex : 120",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 90.0,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const SizedBox(
                    height: 80.0,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 40,
                    onPressed: () {
                      savePrefSuger(Suger.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllPatientContentPage()));
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
