import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String myId = "null";
  // int stkIndex = 0;
  // void getDeviceId() async {
  //   myId = await PlatformDeviceId.getDeviceId;
  //   setState(() {
  //     myId = myId;
  //   });
  // }

  // int i = 0;
  // bool internet = true;
  // List<String> idList = [
  //   "ac2002f5737b89af",
  //   "343b30b0e02b6c5e",
  //   "974fde90d7b4fc98" //ayushi pupul
  // ];

  // @override
  // void initState() {
  //   getDeviceId();
  //   super.initState();
  // }

  // int mainstkidx = 0;
  // int yti = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: WebView(
          initialUrl: "https://dheerajdk60.github.io/rooM1",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      )),
    );
  }
}
