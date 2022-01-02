import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'package:graduation_projectflutter/ui/getid2.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class getid extends StatefulWidget {
  @override
  _BreakFastssState createState() => _BreakFastssState();
}

class _BreakFastssState extends State<getid> {
  late String Id = "";
  late String username = "BaraaSaleh";

  @override
  void initState() {
    super.initState();
  }

  Future getPatientID() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/GetID.php";
    var data = {
      "UserName": username.toString(),
    };
    var res = await http.post(Uri.parse(theUrl),
        body: data, headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    print("THIS IS HASAN ID :");
    print(responceBody);
    return responceBody;
  }

  getId() {
    if (Id != null) {
      getPatientID();
    } else {
      print("Id Null");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ID"),
          centerTitle: true,
          backgroundColor: HexColor('#FA7D82').withOpacity(0.5),
          elevation: 6,
        ),
        body: FutureBuilder(
          future: getPatientID(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return getid2(
                    Id: snapshot.data[i]['Id']!,
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
