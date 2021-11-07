import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/utility/widgets.dart';

class DoctorRegistration extends StatefulWidget {
  const DoctorRegistration({Key? key}) : super(key: key);

  @override
  _DoctorRegistrationState createState() => _DoctorRegistrationState();
}

class _DoctorRegistrationState extends State<DoctorRegistration> {
  String _username = '', _password = '', _confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20.0,
        backgroundColor: Colors.teal,
        title: const Text(
          "Doctor Registration",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.lightGreen,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(70.0),
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
                  decoration:
                      buildInputDecoration("Enter Frist Name", Icons.person),
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
                  decoration:
                      buildInputDecoration("Enter Last Name", Icons.person),
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
                const Text(
                  'Clinic Address',
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
                  validator: (value) => value!.isEmpty
                      ? 'Please enter your Clinic Address'
                      : null,
                  onSaved: (value) => _password = value!,
                  decoration: buildInputDecoration(
                      "Enter your Clinic Address", Icons.home),
                ),

                const SizedBox(
                  height: 20.0,
                ),

                const SizedBox(
                  height: 20.0,
                ),
                // auth.loggedInStatus == Status.Authenticating
                //     ?loading
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    //  Navigator.push(context, MaterialPageRoute(
                    // builder: (context) => Login()));
                  },
                  color: Colors.teal,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
