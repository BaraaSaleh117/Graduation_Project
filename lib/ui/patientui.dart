// ignore: file_names
// ignore_for_file: unnecessary_const, avoid_unnecessary_containers, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:graduation_projectflutter/components/meallist.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'package:graduation_projectflutter/ui/mealsui/breakfast.dart';
import 'package:graduation_projectflutter/ui/mealsui/breakfastlistview.dart';
import 'package:graduation_projectflutter/ui/mealsui/dinner.dart';
import 'package:graduation_projectflutter/ui/mealsui/lunch.dart';
import 'package:graduation_projectflutter/ui/mealsui/snack.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PatientUi extends StatefulWidget {
  const PatientUi({Key? key}) : super(key: key);

  @override
  _PatientUiState createState() => _PatientUiState();
}

class _PatientUiState extends State<PatientUi> {
  var ListSearch = [];
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  var weight;
  var Height;
  var Age;
  var Drugs;
  var ChronicDiseases;

  var Weight;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      weight = preferences.getString("weight");
    });
    print(weight + "//////////////////");
    return weight.toString();
  }

  getqPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Height = preferences.getString("Height");
      Age = preferences.getString("Age");
      Drugs = preferences.getString("Drugs");
      ChronicDiseases = preferences.getString("ChronicDiseases");
    });
    print(Height + Age + Drugs + ChronicDiseases);
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

  @override
  void initState() {
    getData();
    getPref();
    getqPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (weight != null) {
      Weight = weight;
    } else {
      Weight = "";
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Homepage",
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
          elevation: 6,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context, delegate: DataSearch(list: ListSearch));
                }),
          ],
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(bottom: 20),
                height: 250.0,
                width: double.infinity,
                child: Carousel(
                  images: [
                    Image.asset(
                      "lib/assets/a1.jpg",
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "lib/assets/a2.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "lib/assets/a3.jpg",
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "lib/assets/a4.jpg",
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "lib/assets/a6.jpg",
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "lib/assets/a7.jpg",
                      fit: BoxFit.fill,
                    ),
                  ],
                  dotColor: Colors.amber,
                  //dotBgColor: Colors.amber.withOpacity(0.5),
                  //  showIndicator: false,
                )), //End Carousel

            //Strart
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "Calories",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: FitnessAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: const Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: const Radius.circular(60.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: FitnessAppTheme.grey.withOpacity(0.7),
                        offset: const Offset(1.1, 15.1),
                        blurRadius: 10.0),
                  ],
                ),
                height: 170,
                width: double.infinity,
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                        Height + Age + Drugs + ChronicDiseases,
                        style: TextStyle(fontSize: 30),
                      ),
                      onTap: () {},
                    ),
                  ],
                )),

            //Start Meals
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "Meals Today",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //Start Meals Container
            Container(
              height: 160,
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: HexColor('#FA7D82').withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                    ),
                    height: 120,
                    width: 150,
                    child: ListTile(
                      title: Image.asset(
                        "lib/assets/fitness_app/breakfast.png",
                      ),
                      subtitle: Container(
                          child: const Text(
                        "BreakFast",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                      onTap: () {
                        //  Navigator.of(context).pushNamed("BreakFast");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BreakFastss()));
                      },
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      color: HexColor('#5C5EDD').withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                    ),
                    child: ListTile(
                      title: Image.asset(
                        "lib/assets/fitness_app/lunch.png",
                      ),
                      subtitle: Container(
                          child: const Text(
                        "Lunch",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Lunch()));
                      },
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      color: HexColor('#FA7D82').withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                    ),
                    child: ListTile(
                      title: Image.asset(
                        "lib/assets/fitness_app/snack.png",
                      ),
                      subtitle: Container(
                          child: const Text(
                        "Snack",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Snacks()));
                      },
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      color: HexColor('#5C5EDD').withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                    ),
                    child: ListTile(
                      title: Image.asset(
                        "lib/assets/fitness_app/dinner.png",
                      ),
                      subtitle: Container(
                          child: const Text(
                        "Dinner",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dinner()));
                      },
                    ),
                  )
                ],
              ),
            ),
            //End Meals Container

            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "Water",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: FitnessAppTheme.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: const Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: const Radius.circular(60.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: FitnessAppTheme.nearlyBlue.withOpacity(0.7),
                      offset: const Offset(1.1, 7.1),
                      blurRadius: 10.0),
                ],
              ),
              height: 170,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  List<dynamic> list;

  var country_pref;
  DataSearch({required this.list});

  Future getSearchData() async {
    var url =
        "http://10.0.2.2/graduationProj/graduation_projectflutter/lib/fetch_api/searchmeals.php";
    var data = {'searchmeal': query};
    var res = await http.post(Uri.parse(url),
        body: data, headers: {"Accept": "application/json"});
    var responceBody = jsonDecode(res.body);
    return responceBody;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: const Icon(Icons.arrow_back_sharp),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: getSearchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return mealsList(
                      country: country_pref,
                      Id: snapshot.data[i]['Id']!,
                      Mealname: snapshot.data[i]['Mealname']!,
                      Mealtype: snapshot.data[i]['Mealtype']!,
                      Mealtime: snapshot.data[i]['Mealtime']!,
                      Calories: snapshot.data[i]['Calories']!,
                      Description: snapshot.data[i]['Description']!);
                });
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchList =
        query.isEmpty ? list : list.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: const Icon(Icons.ramen_dining_rounded),
            title: Text(searchList[i]),
            onTap: () {
              query = searchList[i];
              showResults(context);
            },
          );
        });
  }
}
