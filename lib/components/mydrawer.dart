import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Baraa Saleh",
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text(
              "BaraaSaleh@hotmai.com",
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
              "My Diry",
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
              Navigator.of(context).pushNamed("PatientsUi");
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
            onTap: () {},
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
              Icons.sync_problem_sharp,
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
              Icons.hdr_enhanced_select_sharp,
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
