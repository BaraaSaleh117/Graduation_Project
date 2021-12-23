import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BreakFastss extends StatefulWidget {
  const BreakFastss({Key? key}) : super(key: key);

  @override
  _BreakFastssState createState() => _BreakFastssState();
}

class _BreakFastssState extends State<BreakFastss> {
  var ListSearch = [];
  var country_pref;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      country_pref = preferences.getString("country");
    });

    print(country_pref);
  }

  @override
  void initState() {
    //getPref();
    getData();
    super.initState();
  }

  Future getData() async {
    var url =
        "http://10.0.2.2/graduationProj/graduation_projectflutter/lib/fetch_api/getmealss.php";
    var res =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    for (int i = 0; i < responceBody.length; i++) {
      ListSearch.add(responceBody[i]['Mealname']);
    }
  }

  Future getMeals() async {
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/getmealss.php";
    var res = await http
        .get(Uri.parse(theUrl), headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    return responceBody;
  }

  Future getBreakFasts() async {
    //Get Patients Data From Localhost API
    String theUrl =
        "http://10.0.2.2/GraduationProj/graduation_projectflutter/lib/fetch_api/GetBreakFasts.php";
    var data = {"mealtype": "Breakfast"};
    var res = await http.post(Uri.parse(theUrl),
        body: data, headers: {"Accept": "application/json"});
    var responceBody = json.decode(res.body);
    return responceBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BreakFasts"),
          centerTitle: true,
          backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
          elevation: 6,
        ),
        body: FutureBuilder(
          future: getBreakFasts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return mealsList(
                      country: country_pref,
                      Id: snapshot.data[i]['Id']!,
                      url: snapshot.data[i]['url']!,
                      Mealname: snapshot.data[i]['Mealname']!,
                      Mealtype: snapshot.data[i]['Mealtype']!,
                      Mealtime: snapshot.data[i]['Mealtime']!,
                      Calories: snapshot.data[i]['Calories']!,
                      Description: snapshot.data[i]['Description']!);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}


  






//  showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text("Search"),
//                           content: Container(
//                             height: 120,
//                             child: Column(
//                               children: [
//                                 Text(
//                                     "Enter the name of the meal you want to search for"),
//                                 TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: "Write here",
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           actions: <Widget>[
//                             FlatButton(onPressed: () {}, child: Text("Ok")),
//                             FlatButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: Text("Exit")),
//                           ],
//                         );
//                       });
//                 },
 
