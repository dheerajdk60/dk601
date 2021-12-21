import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:device_id/device_id.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String s = "https://1dheeraj1.github.io/2DK60/";
  int i = 0;
  String a = "nnn";

  void getDeviceId() async {
    a = await DeviceId.getID;
    setState(() {
      a = a;
    });
    print(a);
  }

  @override
  Widget build(BuildContext context) {
    getDeviceId();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: IndexedStack(index: i, children: <Widget>[
                Container(
                    child: WebView(
                  initialUrl: s,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebResourceError: (error) {
                    setState(() {
                      i = 1;
                    });
                  },
                )),
                Container(
                  child: Center(
                    child: Text(
                      "On the Internet",
                      style: TextStyle(
                          fontFamily: "Lombok",
                          color: Colors.lightGreenAccent,
                          fontSize: 30),
                    ),
                  ),
                  color: Colors.black,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Text(a),
                      ],
                    ),
                  ),
                ),
              ]),
            )));
  }
}





















/*


class _WebState extends State<Web> {
  secure() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) {
    secure();

    SystemChrome.setPreferredOrientations(
            [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
        .then((_) {
      return Container(
          child: WebView(
        initialUrl: "https://dk60online.github.io/class/",
        javascriptMode: JavascriptMode.unrestricted,
      ));
    });
  }
}
*/