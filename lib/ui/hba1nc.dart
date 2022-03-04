import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/ui/allpatientcontentpage.dart';
import 'package:graduation_projectflutter/ui/connectwithscale.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HbA1c extends StatefulWidget {
  const HbA1c({Key? key}) : super(key: key);

  @override
  _HbA1cState createState() => _HbA1cState();
}

TextEditingController _Value = TextEditingController();
TextEditingController _Date = TextEditingController();

savePref(String Value, String Date) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString("HValue", Value);
  preferences.setString("HDate", Date);
}

class _HbA1cState extends State<HbA1c> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: HexColor('#FA7D82').withOpacity(0.8),
        title: Text("HbA1c Check"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.only(top: 30, right: 5, left: 30)),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 10),
              decoration: BoxDecoration(
                color: HexColor('#FA7D82').withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40)),
              ),
              child: Text(
                "The HbA1c test is a very important test for glycosylated hemoglobin. It should be done at least once every three months for diabetic patients.",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 5,
                    letterSpacing: 3,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              color: Colors.black38,
              width: double.infinity,
              height: 2,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40)),
              ),
              child: Text(
                "Measurements and cases for the HbA1c test",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 2,
                    letterSpacing: 1,
                    color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 200,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/assets/Hb.png"), fit: BoxFit.fill),
              ),
              child: Text(""),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.black38,
              width: double.infinity,
              height: 2,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              child: Text(
                "If you performed this test within the past three months, enter the value of the last test and the date of the test if possible",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 5,
                    letterSpacing: 3,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Value",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 5,
                  letterSpacing: 3,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            TextField(
                controller: _Value,
                decoration: InputDecoration(
                    labelText: "Ex : 6.5",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Date",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 5,
                  letterSpacing: 3,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            TextField(
                controller: _Date,
                decoration: InputDecoration(
                    labelText: "dd-mm-yy",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              color: Colors.black38,
              width: double.infinity,
              height: 2,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: 280,
              child: MaterialButton(
                minWidth: double.infinity,
                height: 40,
                onPressed: () {
                  savePref(_Value.text, _Date.text);
                  print(_Value.text);
                  print(_Date.text);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ConnectScale()));
                },
                color: HexColor('#FA7D82').withOpacity(0.8),
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
