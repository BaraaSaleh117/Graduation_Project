import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'package:graduation_projectflutter/ui/calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeDoc extends StatefulWidget {
  @override
  _HomeDocState createState() => _HomeDocState();
}

class _HomeDocState extends State<HomeDoc> {
  var status;
  double ss = 0.0;
  bool dan = false;
  var suger;
  var Username;
  bool isSignIn = false;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Username = preferences.getString("Username");
    if (Username != null) {
      setState(() {
        Username = preferences.getString("Username");
        isSignIn = true;
      });
    }
    print(Username);
  }

  @override
  initState() {
    getPref();
    getmsgPref();

    super.initState();
  }

  getmsgPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var msg = preferences.getBool("msg");
    if (msg == true) {
      setState(() {
        dan = true;
      });
    }
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('There is a patient in serious condition'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/Han.jpg"), fit: BoxFit.cover),
        ),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: ListView(
          children: [
            isSignIn
                ? Container(
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 15, bottom: 15)),
                            Icon(
                              Icons.account_circle,
                              size: 35,
                              color: Colors.blue.shade600,
                            ),
                            Text(
                              " Dr. " + Username,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                  shadows: [
                                    Shadow(
                                        color: Colors.blue.shade300,
                                        blurRadius: 7.0,
                                        offset: Offset(2.0, 4.0))
                                  ]),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 4, right: 4, top: 5, bottom: 7),
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                            ),
                          ),
                        ),
                        Text(
                          "Welcome" + "\n" + " Dr. " + Username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.black,
                              shadows: [
                                Shadow(
                                    color: Colors.blue.shade300,
                                    blurRadius: 7.0,
                                    offset: Offset(2.0, 4.0))
                              ]),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                : Container(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 4, right: 4, top: 10, bottom: 10),
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ),
            Row(
              children: [
                Icon(Icons.calendar_today_rounded),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Important dates",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                              color: Colors.blue.shade300,
                              blurRadius: 7.0,
                              offset: Offset(2.0, 4.0))
                        ]),
                  ),
                ), ////////
              ],
            ),
            Container(
              width: 30,
              child: MaterialButton(
                height: 40,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Calendar()));
                },
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70),
                ),
                child: const Text(
                  "View Calender",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 4, right: 4, top: 20, bottom: 100),
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ),
            dan
                ? Container(
                    decoration: BoxDecoration(
                      color: FitnessAppTheme.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(68.0),
                          bottomLeft: const Radius.circular(68.0),
                          bottomRight: Radius.circular(68.0),
                          topRight: const Radius.circular(68.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: FitnessAppTheme.nearlyBlack.withOpacity(0.7),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    padding:
                        EdgeInsets.only(top: 30, bottom: 30, left: 5, right: 5),
                    // color: Colors.red.shade100,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                  'lib/assets/fitness_app/bell.png'),
                            ),
                            Text(
                              " One notification",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 10, right: 10)),
                            Flexible(
                              child: Text(
                                " Please be aware that you have patients whose health condition is serious !!",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  letterSpacing: 0.4,
                                  color: HexColor('#F65283'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
                : Container(
                    decoration: BoxDecoration(
                      color: FitnessAppTheme.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(68.0),
                          bottomLeft: const Radius.circular(68.0),
                          bottomRight: Radius.circular(68.0),
                          topRight: const Radius.circular(68.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: FitnessAppTheme.nearlyBlack.withOpacity(0.7),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    padding:
                        EdgeInsets.only(top: 30, bottom: 30, left: 5, right: 5),
                    // color: Colors.red.shade100,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: Icon(
                                Icons.check_circle_outline_outlined,
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              " One notification",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 10, right: 10)),
                            Flexible(
                              child: Text(
                                "There are no patients whose health condition is extremely dangerous",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  letterSpacing: 0.4,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
          ],
        ),
      ),
    );
  }
}
