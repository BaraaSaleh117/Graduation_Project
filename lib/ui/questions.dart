import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/ui/resolution_a.dart';

class qusetions extends StatefulWidget {
  const qusetions({Key? key}) : super(key: key);

  @override
  _qusetionsState createState() => _qusetionsState();
}

class _qusetionsState extends State<qusetions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Welcome to your Questionnaire page',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/H.png"), fit: BoxFit.cover),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "We are pleased to know some information about you",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                    width: 30,
                  ),
                  const Text(
                    "Enter your height",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    autofocus: true,
                    obscureText: true,
                  ),
                  const Text(
                    "Enter your age",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    autofocus: true,
                    obscureText: true,
                  ),
                  const Text(
                    "If you have any chronic diseases, please write it here ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    autofocus: true,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    autofocus: true,
                  ),
                  TextFormField(
                    autofocus: true,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Enter the names of the drugs if you use",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    autofocus: true,
                    obscureText: true,
                  ),
                  TextFormField(
                    autofocus: true,
                    obscureText: true,
                  ),
                  TextFormField(
                    autofocus: true,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 40,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResolutionA()));
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
