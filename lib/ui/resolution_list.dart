import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/fetch_api/fetchapi.dart';
import 'package:graduation_projectflutter/models/resolution.dart';
import 'package:graduation_projectflutter/ui/questions.dart';

class ResolutionList extends StatelessWidget {
  FetchApi fetchApi = new FetchApi();

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: FutureBuilder(
          future: fetchApi.getPatientResolution(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<PatientResolution> snap = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error Fetching Data"),
              );
            }
            return ListView.builder(
              itemCount: snap.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 4.0,
                  child: ListTile(
                    title: ListTile(
                      title: Text(snap[index].ChronicDiseases),
                      onTap: null,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
