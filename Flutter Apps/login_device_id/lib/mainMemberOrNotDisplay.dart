import 'dart:convert';
import 'package:device_id/device_id.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'package:dart_airtable/dart_airtable.dart';
//"keyRSOUl5Po5GUcVh"
//"appk6Z1pKED33CpCK"
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String myId = "null";
  void getDeviceId() async {
    myId = await DeviceId.getID;
    setState(() {
      myId = myId;
    });
    print(myId);
  }

  List records;
  List<String> idList = new List<String>();
  Future<void> fetch() async {
    String url =
        "https://api.airtable.com/v0/appk6Z1pKED33CpCK/Table%201?maxRecords=5000&view=Grid%20view";
    Map<String, String> header = {"Authorization": "Bearer keyRSOUl5Po5GUcVh"};
    http.Response res = await http.get(url, headers: header);
    Map<String, dynamic> result = json.decode(res.body);
    records = result['records'];
    int len = records.length;
    for (int iii = 0; iii < len; iii++) {
      idList.add(records[iii]['fields']['PhoneId'].toString());
    }
    print(idList);
    setState(() {
      return;
    });
  }

  @override
  void initState() {
    getDeviceId();
    Future.microtask(() async => await this.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: records == null
            ? Center(
                child: Text("Loading..."),
              )
            : Center(
                child: Text(idList.contains(myId)
                    ? "Member"
                    : "$idList Please Register First$myId"),
              ));
  }
}
