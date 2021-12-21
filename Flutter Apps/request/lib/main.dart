import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //"keyRSOUl5Po5GUcVh"
//"appk6Z1pKED33CpCK"
  final String _KEY = "keyRSOUl5Po5GUcVh";
  final String _DOC_KEY = "appk6Z1pKED33CpCK";
  final String _TABLE_NAME = "Table 1";
  final String _TABLE_NAME_TABLE1 = "Test";
  final String _TABLE_TYPE = "Grid view";
  Map<String, dynamic> data = {
    "records": [
      {
        "fields": {
          "phone": "postphone",
          "pass": "Postpass",
          "com": "postcom",
        }
      }
    ]
  };

  //Future<http.Response> _connect() async => await http.get("https://api.airtable.com/v0/$_DOC_KEY/$_TABLE_NAME?api_key=$_KEY&view=$_TABLE_TYPE");
  Future<http.Response> _send({@required Map<String, dynamic> data}) async {
    Map<String, String> header = {"Content-Type": "application/json"};
    try {
      return await http.post(
          "https://api.airtable.com/v0/$_DOC_KEY/$_TABLE_NAME?api_key=$_KEY&view=$_TABLE_TYPE",
          headers: header,
          body: json.encode(data));
    } catch (e) {
      return null;
    }
  }

  void send() async {
    _send(data: data);
    var _result = await _send(data: data);
    Map<String, dynamic> _resultData = json.decode(_result.body);
    print(_resultData);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Container(
            child: RaisedButton(
          child: Text("btn"),
          onPressed: () => {send()},
          color: Colors.blue,
        )),
      ),
    ));
  }
}
