import 'package:flutter/material.dart';
import 'package:platform_device_id/platform_device_id.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String a = "nnn";

  void getdata() async {
    a = await PlatformDeviceId.getDeviceId;
    setState(() {
      a = a;
    });
    print(a);
  }

  @override
  Widget build(BuildContext context) {
    getdata();
    //getdata();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
          body: Center(
        child: Text(
          a,
        ),
      )),
    );
  }
}
