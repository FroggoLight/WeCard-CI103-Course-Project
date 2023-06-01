// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:carde2/Pages/scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/button.dart';
import '../components/textfield.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class LeftPage extends StatefulWidget {
  LeftPage({super.key});

  @override
  State<LeftPage> createState() => _LeftPageState();
}

class _LeftPageState extends State<LeftPage> {
  final _textController = TextEditingController();
  String userID = FirebaseAuth.instance.currentUser!.uid;

  void saveCard() async {
    String userID = await FirebaseAuth.instance.currentUser!.uid;

    if (await isStringInUserCollection(_textController.text)) {
      await FirebaseFirestore.instance.collection('users').doc(userID).set({
        'cardCollection': FieldValue.arrayUnion([_textController.text])
      }, SetOptions(merge: true));
    } else {
      doesNotExist();
    }
  }

  doesNotExist() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("User Does Not Exist",
                style: TextStyle(color: Colors.red)),
            backgroundColor: Colors.black,
          );
        });
  }

  Future<bool> isStringInUserCollection(String searchString) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where(FieldPath.documentId, isEqualTo: searchString)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 55, 55, 55),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(height: 50),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Share",
                style: GoogleFonts.lalezar(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 60,
                    fontWeight: FontWeight.w400)),
            Text("Card",
                style: GoogleFonts.lalezar(
                    color: Color.fromARGB(255, 20, 161, 27),
                    fontSize: 60,
                    fontWeight: FontWeight.w900))
          ]),
          SizedBox(height: 15),
          MyTextField(
              controller: _textController,
              hintText: "Enter Share Code",
              obscureText: false),
          SizedBox(height: 5),
          MyButton(onTap: saveCard, text: "Add Card", color: Colors.white),
          SizedBox(height: 50),
          QrImageView(
            data: userID,
            version: QrVersions.auto,
            size: 200,
            backgroundColor: Colors.white,
          ),
          SizedBox(height: 10),
          Text("$userID", style: TextStyle(fontSize: 15, color: Colors.white)),
          SizedBox(height: 25),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ScannerPage()));
              },
              child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: Icon(Icons.camera_alt_outlined, color: Colors.white))),
          SizedBox(height: 25),
        ]));
  }
}
