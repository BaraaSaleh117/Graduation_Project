import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDoc extends StatefulWidget {
  @override
  _HomeDocState createState() => _HomeDocState();
}

class _HomeDocState extends State<HomeDoc> {
  var status;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    status = preferences.getString("status");
    print(status);
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
  void initState() {
    super.initState();
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
        child: ListView(),
      ),
    );
  }
}
