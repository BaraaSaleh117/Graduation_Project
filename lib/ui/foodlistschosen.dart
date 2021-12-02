import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/components/mydrawer.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/ui/connectwithscale.dart';
import 'package:graduation_projectflutter/ui/resolution_a.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodListChosen extends StatefulWidget {
  const FoodListChosen({Key? key}) : super(key: key);

  @override
  _FoodListChosenState createState() => _FoodListChosenState();
}

class _FoodListChosenState extends State<FoodListChosen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
            centerTitle: true,
            title: Text("Choosen List Food"),
          ),
          body: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: 70,
                color: Colors.green.withOpacity(0.5),
                child: Text(
                  "Choose your Favorate Food ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 200,
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 30),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  //Start Favorate Food List
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      height: 120,
                      width: 150,
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/bb.jpg",
                          fit: BoxFit.cover,
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 40),
                            child: Text(
                              "Watermelon",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/bu.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              "Orange",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/Egg.jpg",
                          fit: BoxFit.cover,
                        ),
                        subtitle: Container(
                            child: Text(
                          "Egg",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                          textAlign: TextAlign.center,
                        )),
                        onTap: () {},
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/kk.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 40),
                            child: Text(
                              "Cucumber",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/ja.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "Carrots",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/2.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.all(37),
                            child: Text(
                              "Milk",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/ko.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Zucchini",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/le.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 35),
                            child: Text(
                              "Lemon",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/1.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 35),
                            child: Text(
                              "oats",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ), //End Favorate Food List

              SizedBox(
                //Strat Unfavorate food list

                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: 70,
                color: Colors.amber.withOpacity(0.5),
                child: Text(
                  "Choose your UnFavorate Food ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 200,
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 30),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/ko.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Zucchini",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/le.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 35),
                            child: Text(
                              "Lemon",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/1.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 35),
                            child: Text(
                              "oats",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      height: 120,
                      width: 150,
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/bb.jpg",
                          fit: BoxFit.cover,
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 40),
                            child: Text(
                              "Watermelon",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/bu.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              "Orange",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/Egg.jpg",
                          fit: BoxFit.cover,
                        ),
                        subtitle: Container(
                            child: Text(
                          "Egg",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                          textAlign: TextAlign.center,
                        )),
                        onTap: () {},
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/kk.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 40),
                            child: Text(
                              "Cucumber",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/ja.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "Carrots",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/2.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.all(37),
                            child: Text(
                              "Milk",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              // End Unfavorate food list

              SizedBox(
                //Start Allergic Food List
                height: 40,
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                height: 70,
                color: Colors.red.withOpacity(0.5),
                child: Text(
                  "Choose your Allergic Food ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 200,
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 30),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      height: 120,
                      width: 150,
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/1.jpg",
                          fit: BoxFit.cover,
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 40),
                            child: Text(
                              "Oats",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/Egg.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 9),
                            child: Text(
                              "Eggs",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/2.jpg",
                          fit: BoxFit.cover,
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 37),
                            child: Text(
                              "Milk",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/pa.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Cucumber",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/ja.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "Carrots",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/To.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 45),
                            child: Text(
                              "Tomato",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/ko.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Zucchini",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/le.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 35),
                            child: Text(
                              "Lemon",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Image.asset(
                          "lib/assets/Foods/b.jpg",
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 55),
                            child: Text(
                              "Watermelon",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              textAlign: TextAlign.center,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),

              //End Allergic Food List
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 40,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResolutionA()));
                },
                color: Colors.black.withOpacity(0.4),
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}
