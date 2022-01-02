// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/patientPage/fitness_app_theme.dart';
import 'package:graduation_projectflutter/ui/physicalactivity.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class SkippingRope extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skipping Rope',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MySkippingrope(title: 'Skipping Rope'),
    );
  }
}

class MySkippingrope extends StatefulWidget {
  const MySkippingrope({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MySkippingrope createState() => _MySkippingrope();
}

class _MySkippingrope extends State<MySkippingrope> {
  Future<void>? _launched;

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    // onPressed calls using this URL are not gated on a 'canLaunch' check
    // because the assumption is that every device can launch a web URL.
    const String toLaunch1 =
        'https://www.youtube.com/watch?v=tq0D3qO0rhw&ab_channel=JumpRopeMom';
    const String toLaunch2 =
        'https://www.youtube.com/watch?v=NfAJB_L3Q0k&ab_channel=JumpRopeDudes';
    const String toLaunch3 =
        'https://www.youtube.com/watch?v=1BZM2Vre5oc&ab_channel=JumpRopeDudes';
    return Scaffold(
        appBar: AppBar(
          leading: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhysicalActivity()));
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: HexColor('#FA7D82').withOpacity(0.9),
                    size: 30,
                  ))
            ],
            backgroundColor: Colors.white.withOpacity(1),
            elevation: 0,
          ),
          title: Text(widget.title),
          centerTitle: true,
          backgroundColor: HexColor('#FA7D82').withOpacity(0.8),
          elevation: 6,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 25, bottom: 20, top: 20),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assets/fitness_app/rope.jpg"),
                fit: BoxFit.cover),
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 30,
                width: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 170,
                decoration: BoxDecoration(
                  color: FitnessAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: const Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: const Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: FitnessAppTheme.grey.withOpacity(0.4),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      " Rope jumping is a good exercise for diabetics" +
                          "\n" +
                          "\n" +
                          "To learn more about this sport, visit the following website",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: FitnessAppTheme.grey.withOpacity(0.9),
                      ),
                    ),
                    Link(
                      uri: Uri.parse(
                          'https://www.webteb.com/articles/%D9%81%D9%88%D8%A7%D8%A6%D8%AF-%D9%86%D8%B7-%D8%A7%D9%84%D8%AD%D8%A8%D9%84-%D9%85%D8%A7-%D8%A8%D9%8A%D9%86-%D8%B5%D8%AD%D8%A9-%D8%A7%D9%84%D9%82%D9%84%D8%A8-%D9%88%D8%A7%D9%84%D8%AC%D9%85%D8%A7%D9%84_17445'),
                      target: LinkTarget.blank,
                      builder: (BuildContext ctx, FollowLink? openLink) {
                        return TextButton.icon(
                          onPressed: openLink,
                          label: const Text('Learn more'),
                          icon: const Icon(Icons.read_more),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: const Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topRight: const Radius.circular(0.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FitnessAppTheme.grey.withOpacity(0.4),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Recommended time : 15 - 20 Minutes / day",
                        style: TextStyle(
                            color: FitnessAppTheme.nearlyBlue,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Text(
                        "Recommended intensity : MEDIUM  ",
                        style: TextStyle(
                            color: FitnessAppTheme.lightText,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              SizedBox(
                height: 20,
                width: 20,
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 30),
                decoration: BoxDecoration(
                  color: FitnessAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: const Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: const Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: FitnessAppTheme.grey.withOpacity(0.4),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "You can practically exercise by watching clips on the YouTube ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: FitnessAppTheme.grey.withOpacity(0.9),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset('lib/assets/y.png'),
                    ),
                    const Padding(padding: EdgeInsets.all(10.0)),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: HexColor('#FA7D82').withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Text(
                          "HIGH INTENSITY EXERCISE",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          setState(() {
                            _launched = _launchInBrowser(toLaunch1);
                          });
                        },
                      ),
                    ),

                    SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: HexColor('#FA7D82').withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Text(
                          "MEDIUM INTENSITY EXERCISE",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          setState(() {
                            _launched = _launchInBrowser(toLaunch2);
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: HexColor('#FA7D82').withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(.0),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: ListTile(
                        title: Text(
                          "LOW INTENSITY EXERCISE",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          setState(() {
                            _launched = _launchInBrowser(toLaunch3);
                          });
                        },
                      ),
                    ),

                    // Link(
                    //   uri: Uri.parse(
                    //       'https://pub.dev/documentation/url_launcher/latest/link/link-library.html'),
                    //   target: LinkTarget.blank,
                    //   builder: (BuildContext ctx, FollowLink? openLink) {
                    //     return TextButton.icon(
                    //       onPressed: openLink,
                    //       label: const Text('Link Widget documentation'),
                    //       icon: const Icon(Icons.read_more),
                    //     );
                    //   },
                    // ),
                    //  decoration: BoxDecoration(
                    // color: Colors.amber.withOpacity(0.5),
                    // borderRadius: const BorderRadius.only(
                    //     topRight: Radius.circular(.0),
                    //     topLeft: Radius.circular(40),
                    //     bottomRight: Radius.circular(40)),
                    FutureBuilder<void>(
                        future: _launched, builder: _launchStatus),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
