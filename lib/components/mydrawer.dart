import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/home.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/ui/allpatientcontentpage.dart';
import 'package:graduation_projectflutter/ui/connectwithscale.dart';
import 'package:graduation_projectflutter/ui/detcalview.dart';
import 'package:graduation_projectflutter/ui/diabetesregulation.dart';
import 'package:graduation_projectflutter/ui/hba1nc.dart';
import 'package:graduation_projectflutter/ui/patientUi.dart';
import 'package:graduation_projectflutter/ui/patientlogin.dart';
import 'package:graduation_projectflutter/ui/questions.dart';
import 'package:graduation_projectflutter/ui/resolution_a.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var username;
  bool isSignIn = false;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username = preferences.getString("username");
    if (username != null) {
      setState(() {
        username = preferences.getString("username");
        isSignIn = true;
      });
    }
    print(username);
  }

  @override
  initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: isSignIn
                ? Text(
                    username,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )
                : Text(""),
            accountEmail: Text(
              "",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.person_pin,
                color: Colors.white,
                size: 59,
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                image: DecorationImage(
                    image: AssetImage("lib/assets/wwe.jpg"), fit: BoxFit.fill)),
          ),
          ListTile(
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.home_outlined,
              color: HexColor('#FA7D82').withOpacity(0.8),
              size: 40,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllPatientContentPage()));
            },
          ),
          ListTile(
            title: Text(
              "Questionnaire Page",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.border_color_outlined,
              color: HexColor('#FA7D82').withOpacity(0.8),
              size: 35,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => qusetions()));
            },
          ),
          ListTile(
            title: Text(
              "Physical Activity Level Page",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.volunteer_activism_outlined,
              color: HexColor('#FA7D82').withOpacity(0.8),
              size: 35,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetCaloView()));
            },
          ),
          ListTile(
            title: Text(
              "HbA1c Check Page",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.fact_check_outlined,
              color: HexColor('#FA7D82').withOpacity(0.8),
              size: 35,
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HbA1c()));
            },
          ),
          ListTile(
            title: Text(
              "Weight scale page",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.monitor_weight_rounded,
              color: HexColor('#FA7D82').withOpacity(0.8),
              size: 35,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ConnectScale()));
            },
          ),
          ListTile(
            title: Text(
              "Blood Sugar Measurement Page",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.directions_railway_sharp,
              color: HexColor('#FA7D82').withOpacity(0.8),
              size: 35,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResolutionA()));
            },
          ),
          Divider(
            color: Colors.black,
            height: 30,
          ),
          ListTile(
            title: Text(
              "About Us",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.info_outline,
              color: HexColor('#FA7D82').withOpacity(0.8),
              size: 35,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "Exit",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.explicit_outlined,
              color: Colors.black,
              size: 35,
            ),
            onTap: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.remove("username");

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ],
      ),
    );
  }
}
