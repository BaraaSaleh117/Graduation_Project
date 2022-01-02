import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/ui/diabetesregulation.dart';
import 'package:graduation_projectflutter/ui/questions.dart';

import 'package:graduation_projectflutter/utility/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PatientsRegister extends StatefulWidget {
  late final String? Id;
  PatientsRegister({this.Id});
  @override
  _PatientsRegisterState createState() => _PatientsRegisterState();
}

class _PatientsRegisterState extends State<PatientsRegister> {
  TextEditingController Firstname = new TextEditingController();
  TextEditingController Lastname = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  TextEditingController confarmpass = new TextEditingController();
  GlobalKey<FormState> Formstate = new GlobalKey<FormState>();

  Future PostNewPatient() async {
    var url =
        "http://10.0.2.2/graduationProj/graduation_projectflutter/lib/PostData/AddnewPatient.php";
    var data = {
      "UserName": username.text,
      "Password": Password.text,
    };
    var responce = await http.post(Uri.parse(url), body: data);
    print("////////********************");
    print(responce.body.toString());
    print("////////********************");
  }

  signup() async {
    var formdata = Formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      PostNewPatient();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => qusetions()));
    }
    print("Not Valid ");
  }

  savePref(String username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("username", username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 20.0,
        backgroundColor: HexColor('#FA7D82').withOpacity(0.8),
        title: const Text(
          "Patients Registration",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assets/dee.jpg"), fit: BoxFit.cover),
          ),
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Form(
            key: Formstate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "First Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  autofocus: false,
                  controller: Firstname,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "First Name can't be Empty ";
                    } else if (value.trim().length < 2) {
                      return "First Name can't be less than 2 letter ";
                    } else if (value.trim().length > 20) {
                      return "User Name can't be greater than 20 letter";
                    }
                  },
                  decoration: buildInputDecoration(
                      "Enter Frist Name", Icons.person_outlined),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Last Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  autofocus: false,
                  controller: Lastname,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Last Name can't be Empty ";
                    } else if (value.trim().length < 2) {
                      return "Last Name can't be less than 2 letter ";
                    } else if (value.trim().length > 20) {
                      return "Last Name can't be greater than 20 letter";
                    }
                  },
                  decoration: buildInputDecoration(
                      "Enter Last Name", Icons.person_outline_sharp),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  'Username',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                TextFormField(
                  autofocus: false,
                  controller: username,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username can't be Empty ";
                    } else if (value.trim().length < 5) {
                      return "Username can't be less than 5 letter ";
                    } else if (value.trim().length > 20) {
                      return "Username can't be greater than 20 letter";
                    }
                  },
                  decoration:
                      buildInputDecoration("Enter Username", Icons.person_pin),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  autofocus: false,
                  controller: Password,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password can't be Empty ";
                    } else if (value.trim().length < 3) {
                      return "Password can't be less than 3 letter ";
                    } else if (value.trim().length < 4) {
                      return "Please use a stronger password";
                    }
                  },
                  decoration:
                      buildInputDecoration("Enter Password", Icons.lock),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  controller: confarmpass,
                  validator: (value) {
                    if (value! != Password.text) {
                      return "Password does not match !";
                    }
                  },
                  decoration:
                      buildInputDecoration(" Confirm Password", Icons.lock),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 40,
                  onPressed: () {
                    if (username != null) {
                      savePref(username.text);
                    }
                    signup();
                  },
                  color: HexColor('#FA7D82').withOpacity(0.8),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
