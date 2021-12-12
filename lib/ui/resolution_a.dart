import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/ui/allpatientcontentpage.dart';
import 'package:graduation_projectflutter/ui/connectwithscale.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResolutionA extends StatefulWidget {
  const ResolutionA({Key? key}) : super(key: key);

  @override
  _ResolutionAState createState() => _ResolutionAState();
}

TextEditingController Suger = TextEditingController();

class _ResolutionAState extends State<ResolutionA> {
  savePrefSuger(String Sugerb) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("Sugerb", Sugerb);
    print(preferences.getString("Sugerb"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/Se1.png"), fit: BoxFit.fill),
            ),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: const EdgeInsets.all(40.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Blood glucose meter device",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "To measure blood sugar, a glucose meter is used,Use the device and enter the value ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    "Enter the value",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  TextFormField(
                    controller: Suger,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    autofocus: false,
                  ),
                  const SizedBox(
                    height: 90.0,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const SizedBox(
                    height: 20.0,
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
                    height: 40.0,
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
}
