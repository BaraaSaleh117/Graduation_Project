// ignore: file_names
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class PatientUi extends StatefulWidget {
  const PatientUi({Key? key}) : super(key: key);

  @override
  _PatientUiState createState() => _PatientUiState();
}

class _PatientUiState extends State<PatientUi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Homepage",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.amber.shade300,
          elevation: 6,
        ),
        drawer: Drawer(
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
                        image: AssetImage("lib/assets/H.png"),
                        fit: BoxFit.fill)),
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
                onTap: () {},
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
        ),
        body: ListView(
          children: <Widget>[
            Container(
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

            //Start Meals
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Meals Today",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 120,
                    child: ListTile(
                      title: Image.asset(
                        "lib/assets/fitness_app/breakfast.png",
                      ),
                      subtitle: Container(
                          child: Text(
                        "BreakFast",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    child: ListTile(
                      title: Image.asset(
                        "lib/assets/fitness_app/lunch.png",
                      ),
                      subtitle: Container(
                          child: Text(
                        "Lunch",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    child: ListTile(
                      title: Image.asset(
                        "lib/assets/fitness_app/snack.png",
                      ),
                      subtitle: Container(
                          child: Text(
                        "Snack",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    child: ListTile(
                      title: Image.asset(
                        "lib/assets/fitness_app/dinner.png",
                      ),
                      subtitle: Container(
                          child: Text(
                        "Dinner",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                      onTap: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
