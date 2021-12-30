import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/main.dart';

import 'package:graduation_projectflutter/utility/widgets.dart';

class PatientsRegister extends StatefulWidget {
  @override
  _PatientsRegisterState createState() => _PatientsRegisterState();
}

class _PatientsRegisterState extends State<PatientsRegister> {
  String _username = '', _password = '', _confirmPassword = '';
  //final _GendersDropDownList = ["Male", "Female", "NA"];
  // String _genderDropDownList = "NA";
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
            //  key: formKey,
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
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your Frist Name' : null,
                  onSaved: (value) => _password = value!,
                  decoration: buildInputDecoration(
                      "Enter Frist Name", Icons.accessibility),
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
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your Last Name' : null,
                  onSaved: (value) => _password = value!,
                  decoration: buildInputDecoration(
                      "Enter Last Name", Icons.accessibility),
                ),

                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                TextFormField(
                  autofocus: false,
                  onSaved: (value) => _username = value!,
                  decoration: buildInputDecoration("Enter Email", Icons.email),
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
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter password' : null,
                  onSaved: (value) => _password = value!,
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
                  validator: (value) =>
                      value!.isEmpty ? 'Your password is required' : null,
                  onSaved: (value) => _confirmPassword = value!,
                  decoration:
                      buildInputDecoration(" Confirm Password", Icons.lock),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Phone Number',
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
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your Phone Number' : null,
                  onSaved: (value) => _password = value!,
                  decoration:
                      buildInputDecoration("Enter Phone Number", Icons.phone),
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
                // auth.loggedInStatus == Status.Authenticating
                //     ?loading
                MaterialButton(
                  minWidth: double.infinity,
                  height: 40,
                  onPressed: () {
                    //  Navigator.push(context, MaterialPageRoute(
                    // builder: (context) => Login()));
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

    /* ListTile(    ----->  DropDownList 
                    title: DropdownButton<String>(
                  items: _GendersDropDownList.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  value: retrieveGender(patient.Gender),
                  onChanged: (value) => updateGender(value!),
                )),

    String retrieveGender(String value) {
    return _GendersDropDownList[];
  }

  void updateGender(String value) {
    switch (value) {
      case "Male":
        patient.Gender = "Male";
        break;
         case "Female":
        patient.Gender = "Female";
        break;
         case "NA":
        patient.Gender = "NA";
        break;
    }*/
  }
}
