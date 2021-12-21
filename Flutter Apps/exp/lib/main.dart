import 'package:flutter/material.dart';

void main() {
  runApp(new Dj());
}

class Dj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 200,
            width: 50,
            color: Colors.blueAccent,
            child: Center(child: Text("hai")),
          ),
        ),
      ),
    ));
  }
}
