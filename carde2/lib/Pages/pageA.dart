// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/card.dart';

class LeftPage extends StatelessWidget {
  LeftPage({super.key});

  void addCard() async {
    await FirebaseFirestore.instance.collection('users').add({});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 55, 55, 55),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(height: 70),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Share",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 40,
                    fontWeight: FontWeight.w400)),
            Text("Card",
                style: TextStyle(
                    color: Color.fromARGB(255, 20, 161, 27),
                    fontSize: 50,
                    fontWeight: FontWeight.w900))
          ])
        ]));
  }
}
