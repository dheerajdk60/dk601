import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Phoenix(child: MyApp()),
    ));
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
    print(myId);
  }

  String dispMember() {
    setState(() {
      stkIndex = 1;
      print("dispmember$stkIndex");
    });
    return "";
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

  int mainstkidx = 0;
  int yti = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.replay),
            onPressed: () {
              Phoenix.rebirth(context);
            }),
        resizeToAvoidBottomInset: false,
        body: IndexedStack(
            index: (mainstkidx == 0) ? (idList.contains(myId) ? 1 : 0) : 2,
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 3),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: records == null
                    ? Container(
                        color: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(""),
                            Center(
                              child: Text(
                                "LOADING...",
                                style: TextStyle(
                                    fontFamily: "Lombok",
                                    color: Colors.lightGreenAccent,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "(Restart The App If Page Doesn't Proceed)",
                                style: TextStyle(
                                    color: Colors.blue.shade400,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        color: Colors.black,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Expanded(
                                child: Text("Welcome To DK60",
                                    style: TextStyle(
                                        fontFamily: "Lombok",
                                        letterSpacing: 5,
                                        color: Colors.redAccent,
                                        fontSize: 40)),
                              ),
                              Expanded(
                                  child: Container(
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Colors.blue,
                                  splashColor: Colors.lightGreenAccent,
                                  textColor: Colors.black,
                                  onPressed: () {
                                    setState(() {
                                      mainstkidx = 2;
                                    });
                                  },
                                  child: Text(
                                    "Watch First 15 Days Classes For Free",
                                    style: TextStyle(
                                        letterSpacing: 3,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              )),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Text(
                                        "(ERROR_CODE:" +
                                            myId +
                                            ")\n\nOOPS!!! Looks like you are new here. Send ScreenShot of this page and screenshot of fees payment to the whatsapp number +917026911691 to activate account.",
                                        style: TextStyle(
                                            letterSpacing: 5,
                                            color: Colors.lightGreenAccent,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              Container(
                child: Web(),
              ),
              Container(
                  child: IndexedStack(index: yti, children: <Widget>[
                Container(
                  color: Colors.black,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 3),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    ExactAssetImage('images/dp.jpg'),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Dheeraj Kumar",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.red[800]),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "(Hint:Click below or Search in youtube for 'Dheeraj kumar' to find the playlist there)",
                            style: TextStyle(color: Colors.blue),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 3),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                child: Text(
                                  "START WATCHING DEMO",
                                  style: TextStyle(
                                      fontFamily: "Lombok",
                                      color: Colors.lightGreenAccent,
                                      fontSize: 50,
                                      fontWeight: FontWeight.w900),
                                ),
                                color: Colors.black12,
                                onPressed: () async {
                                  await FlutterWindowManager.addFlags(
                                      FlutterWindowManager.FLAG_SECURE);
                                  setState(() {
                                    yti = 1;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                    child: WebView(
                  initialUrl: "https://dheerajdk60.github.io/youtube/",
                  javascriptMode: JavascriptMode.unrestricted,
                )),
              ]))
            ]));
  }
}

class Web extends StatefulWidget {
  @override
  _WebState createState() => _WebState();
}

class _WebState extends State<Web> {
  int sti = 0;
  int f = 0;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(index: sti, children: <Widget>[
      Container(
        color: Colors.black,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 3),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: RaisedButton(
              child: Text(
                "START",
                style: TextStyle(
                    fontFamily: "Lombok",
                    color: Colors.lightGreenAccent,
                    fontSize: 50,
                    fontWeight: FontWeight.w900),
              ),
              color: Colors.black12,
              onPressed: () async {
                await FlutterWindowManager.addFlags(
                    FlutterWindowManager.FLAG_SECURE);
                setState(() {
                  sti = 1;
                });
              },
            ),
          ),
        ),
      ),
      Container(
          child: WebView(
        initialUrl: "https://dheerajdk60.github.io/sep/",
        javascriptMode: JavascriptMode.unrestricted,
      )),
    ]);
  }
}
