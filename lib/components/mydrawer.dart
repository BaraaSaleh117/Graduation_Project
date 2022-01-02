import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/home.dart';
import 'package:graduation_projectflutter/ui/diabetesregulation.dart';
import 'package:graduation_projectflutter/ui/patientUi.dart';
import 'package:graduation_projectflutter/ui/patientlogin.dart';
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
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )
                : Text(""),
            accountEmail: Text(
              "",
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                image: DecorationImage(
                    image: AssetImage("lib/assets/H.png"), fit: BoxFit.fill)),
          ),
          ListTile(
            title: Text(
              "Home",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.home,
              color: Colors.teal,
              size: 35,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PatientUi()));
            },
          ),
          ListTile(
            title: Text(
              "Meals Today",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.ramen_dining_rounded,
              color: Colors.teal,
              size: 35,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DiabetesReg()));
            },
          ),
          ListTile(
            title: Text(
              "Physical Activity",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.fitness_center,
              color: Colors.teal,
              size: 35,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "My Evaluation",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.assignment,
              color: Colors.teal,
              size: 35,
            ),
            onTap: () {},
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
              color: Colors.blueAccent,
              size: 35,
            ),
            onTap: () {},
          ),
          Divider(
            color: Colors.white,
            height: 120,
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
              Icons.exit_to_app_outlined,
              color: Colors.blueAccent,
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
