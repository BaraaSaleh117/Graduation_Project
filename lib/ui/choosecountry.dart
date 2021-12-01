import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseCountry extends StatefulWidget {
  const ChooseCountry({Key? key}) : super(key: key);

  @override
  _ChooseCountryState createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {
  savePref(String country) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("country", country);
    print(preferences.getString("country"));
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var country = preferences.getString("country");
    if (country != null) {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Choose your Country"),
        ),
        drawer: MyDrawer(),
        body: Container(
          child: ListView(
            children: [
              ListTile(
                title: Text("مصر"),
                onTap: () {
                  savePref("Egypt");
                },
              ),
              ListTile(
                title: Text("فلسطين"),
                onTap: () {
                  savePref("Palestine");
                },
              ),
              ListTile(
                title: Text("الاردن"),
                onTap: () {},
              ),
              ListTile(
                title: Text("العراق"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
