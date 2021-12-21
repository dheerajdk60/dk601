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
    "ac2002f5737b89af",
    "343b30b0e02b6c5e",
    "974fde90d7b4fc98" //ayushi pupul
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
                            child: RaisedButton(
                              onPressed: () {
                                setState(() {
                                  i = 1;
                                });
                              },
                              color: Colors.black,
                              splashColor: Colors.blue,
                              child: Text(
                                "START",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontFamily: "Lombok",
                                    fontWeight: FontWeight.w800,
                                    color: Colors.green),
                              ),
                            ),
                          ),
                          WebView(
                            //
                            initialUrl: "https://dheerajdk60.github.io/vivek",
                            javascriptMode: JavascriptMode.unrestricted,
                            onPageFinished: (url) {
                              print("completely loaded");
                            },
                            onWebResourceError: (error) {
                              print("no internet");
                              setState(() {
                                i = 2;
                              });
                            },
                            onPageStarted: (url) {},
                          ),
                          Container(
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "On the internet",
                                style: TextStyle(
                                    fontFamily: "Lombok",
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.green),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
        ));
  }
}
