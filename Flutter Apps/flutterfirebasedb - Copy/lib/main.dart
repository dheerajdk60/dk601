import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = Firestore.instance;
bool read = true;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(title: 'Firestore Example', home: App()));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

void add() async {
  read = false;
  await db.collection("userid").add({'name': 'dheeraj', 'age': 25});
  db.collection("userid").snapshots().listen((result) {
    result.documentChanges.forEach((res) {
      if (read == false) if (res.type == DocumentChangeType.added) {
        print("added");
        print(res.document.documentID);
      } else if (res.type == DocumentChangeType.modified) {
        print("modified");
        print(res.document.documentID);
      } else if (res.type == DocumentChangeType.removed) {
        print("removed");
        print(res.document.documentID);
      }
      read = true;
    });
  });
}

void delete() async {
  read = false;
  await db.collection("userid").document('new').delete();
}

void getall() async {
  QuerySnapshot snap = await db.collection("userid").getDocuments();
  for (int i = 0; i < snap.documents.length; i++) {
    var f = snap.documents[i];
    if (f.data['age'] < 30) {
      db
          .collection('userid')
          .document(f.documentID)
          .updateData({'gender': 'male'});
    }
  }
}

void data(Map d) {
  print(d['name']);
}

void create() async {
  read = false;
  await db
      .collection("userid")
      .document('new')
      .setData({'name': 'create', 'age': 20});
}

void update() {
  read = false;
  db.collection('books').document('1').updateData({'gender': 'male'});
}

File image;
void pick() async {
  print("indise piuc");
  image = await ImagePicker.pickImage(source: ImageSource.gallery);
  StorageUploadTask ut =
      FirebaseStorage.instance.ref().child("c.jpg").putFile(image);
  var url = await (await ut.onComplete).ref.getDownloadURL();
  print(url.toString());
  db
      .collection('userid')
      .document('1')
      .updateData({'name': '${url.toString()}'});
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text("create", style: TextStyle(color: Colors.white)),
            color: Colors.black,
            onPressed: () {
              create();
            },
          ),
          RaisedButton(
            child: Text("add", style: TextStyle(color: Colors.white)),
            color: Colors.black,
            onPressed: () {
              add();
            },
          ),
          RaisedButton(
            child: Text("delete", style: TextStyle(color: Colors.white)),
            color: Colors.black,
            onPressed: () {
              delete();
            },
          ),
          RaisedButton(
            child: Text("pick", style: TextStyle(color: Colors.white)),
            color: Colors.black,
            onPressed: () {
              pick();
            },
          ),
          RaisedButton(
            child: Text("gadd", style: TextStyle(color: Colors.white)),
            color: Colors.black,
            onPressed: () {
              getall();
            },
          ),
        ],
      ),
    );
  }
}
