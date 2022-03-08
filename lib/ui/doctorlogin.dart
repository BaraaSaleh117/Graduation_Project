import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/ui/DoctorUi/doctorhome.dart';
import 'package:graduation_projectflutter/ui/allpatientcontentpage.dart';
import 'package:graduation_projectflutter/ui/doctorregistration.dart';
import 'package:graduation_projectflutter/ui/patientsregister.dart';
import 'package:graduation_projectflutter/ui/patientui1.dart';
import 'package:graduation_projectflutter/ui/questions.dart';
import 'package:graduation_projectflutter/utility/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DoctorLogin extends StatefulWidget {
  const DoctorLogin({Key? key}) : super(key: key);

  @override
  _DoctorLoginState createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  TextEditingController username = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  GlobalKey<FormState> Formstate = new GlobalKey<FormState>();
  bool showsginin = true;
  late TapGestureRecognizer _changesign;
  bool isuser = false;

  savePref(String username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("Username", username);
  }

  signin() async {
    var formdata = Formstate.currentState;

    if (formdata!.validate()) {
      formdata.save();
      var data = {"UserName": username.text, "Password": Password.text};
      var url =
          "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/logind.php";
      var responce = await http.post(Uri.parse(url), body: data);
      var resbody = jsonDecode(responce.body);

      if (resbody['status'] == "yes") {
        print(resbody['UserName']);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => docHomePage()));
      } else {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      }
    } else {
      isuser = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final forgotLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          padding: const EdgeInsets.all(0.0),
          child: const Text("   Don't have an account?",
              style: const TextStyle(
                  fontWeight: FontWeight.w400, color: Colors.black)),
          onPressed: () {
//            Navigator.pushReplacementNamed(context, '/reset-password');
          },
        ),
        FlatButton(
          padding: const EdgeInsets.only(left: 0.0),
          child: const Text("Sign up",
              style:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.black)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DoctorRegistration()));
          },
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/docc.jpg"), fit: BoxFit.fill),
            ),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: const EdgeInsets.all(40.0),
            child: Form(
              key: Formstate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "UesrName",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Enter Username ',
                    ),
                    cursorColor: Colors.black,
                    autofocus: false,
                    controller: username,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "User Name can't be Empty ";
                      } else if (value.trim().length < 4) {
                        return "User Name can't be less than 4 letter ";
                      } else if (value.trim().length > 20) {
                        return "User Name can't be greater than 20 letter";
                      } else if (isuser == true) {
                        return "Username or password is incorrect";
                      }
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    autofocus: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Enter Password ',
                    ),
                    cursorColor: Colors.black,
                    controller: Password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be Empty ";
                      } else if (value.trim().length < 4) {
                        return "Password can't be less than 4 letter ";
                      } else if (value.trim().length > 20) {
                        return "Password can't be greater than 20 letter";
                      }
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      if (username != null) {
                        savePref(username.text);
                      }
                      signin();
                    },
                    color: Colors.black.withOpacity(0.4),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                  forgotLabel
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
