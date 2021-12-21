import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

List al = ["a", "b", "c", "d", "e", "f"];
String b = "hai";
Timer timer;
File image = null;
void vib() {
  timer = Timer.periodic(Duration(seconds: 2), (timer) {
    Vibration.vibrate();
  });
}

void st() {
  timer.cancel();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

void img() async {
  image = await ImagePicker.pickImage(source: ImageSource.gallery);
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            color: Colors.grey,
            child: Center(
              child: Column(
                children: [
                  RaisedButton(
                    child: Text("Start vibrating"),
                    onPressed: () {
                      vib();
                    },
                  ),
                  RaisedButton(
                    child: Text("Stop vibrating"),
                    onPressed: () {
                      st();
                    },
                  ),
                  RaisedButton(
                    child: Text("select imaage"),
                    onPressed: () {
                      img();
                      setState(() {
                        image = image;
                      });
                    },
                  ),
                  Container(
                      child: image == null
                          ? Text("image not loaded")
                          : Container(
                              child: CircleAvatar(
                                backgroundColor: Colors.blue,
                              ),
                            ))
                ],
              ),
            )),
      ),
    );
  }
}
