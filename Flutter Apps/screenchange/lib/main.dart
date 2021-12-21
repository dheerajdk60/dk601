import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:platform_device_id/platform_device_id.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(Phoenix(child: MyApp()));
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String myId = "null";
  int stkIndex = 0;
  void getDeviceId() async {
    myId = await PlatformDeviceId.getDeviceId;
    setState(() {
      myId = myId;
    });
  }

  int i = 0;
  bool internet = true;
  List<String> idList = [
    "343b30b0e02b6c5e", //dheeeraj
    "58cee1c118147b00", //manas
    "58cee1c118147b00", //mukul
    "b7cff9c454883176", //dipanshu
    "126c61aff3a7b830", //monica
    "4f278a627430280a", //suraj
    "21dc89bd8aa3a1ea", //bindu
    "26905178a18630e5", //sonendra
    "f9878e82babf3cf6", //ayushi lahariya
    "357d6aadfa1b225", //harsha
    "ec01a629625ea70e", //navneeth krishna
    "1bc8dd59854f724e", //vikash kumar
    "ef073f33d6d282e3", //rajdip
    "b11b1505d09206e1", //deepak singh
    "69219c9bc59992c3", //priyanka patra
    "aa272712c2de27f5", //shaik mohammad
    "a48c9634156912b4", //annesha nayak
    "c4ab7a2066215866", //pallavi kamal
    "91fc0d550352006f", //mohammad habib
    "c9bf978919985af4", //shirshendu
  ];

  @override
  void initState() {
    getDeviceId();
    super.initState();
  }

  int mainstkidx = 0;
  int yti = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniEndTop,
              floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.replay),
                  onPressed: () {
                    Phoenix.rebirth(context);
                  }),
              body: !idList.contains(myId)
                  ? Container(
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          "Not a memeber \n$myId",
                          style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 3,
                              color: Colors.green),
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.black,
                      child: IndexedStack(
                        index: i,
                        children: <Widget>[
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RaisedButton(
                                  onPressed: () {
                                    if (internet)
                                      setState(() {
                                        i = 1;
                                      });
                                  },
                                  color: Colors.black,
                                  splashColor: Colors.blue,
                                  child: Text(
                                    "ROOM 1",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontFamily: "Lombok",
                                        fontWeight: FontWeight.w800,
                                        color: Colors.green),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          WebView(
                            initialUrl: "https://dheerajdk60.github.io/aug",
                            javascriptMode: JavascriptMode.unrestricted,
                            onPageFinished: (url) {
                              print("completely loaded");
                            },
                            onWebResourceError: (error) {
                              print("no internet");
                              setState(() {
                                internet = false;
                              });
                            },
                            onPageStarted: (url) {},
                          )
                        ],
                      ),
                    )),
        ));
  }
}
