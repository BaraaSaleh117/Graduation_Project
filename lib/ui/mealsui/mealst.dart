import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/ui/mealsui/breakfastlistview.dart';
import 'package:graduation_projectflutter/ui/mealsui/dinner.dart';
import 'package:graduation_projectflutter/ui/mealsui/lunch.dart';
import 'package:graduation_projectflutter/ui/mealsui/snack.dart';

class MealsToday extends StatefulWidget {
  const MealsToday({Key? key}) : super(key: key);

  @override
  _MealsTodayState createState() => _MealsTodayState();
}

class _MealsTodayState extends State<MealsToday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: MyDrawer(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              color: Colors.amber,
              child: Text("Hiii", style: TextStyle(fontSize: 30)),
            ),
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
            )
          ],
        ));

    //End Meals Container
  }
}
