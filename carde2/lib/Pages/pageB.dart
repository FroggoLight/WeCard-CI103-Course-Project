// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../components/card.dart';

class MiddlePage extends StatelessWidget {
  MiddlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 55, 55, 55),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 70),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("My",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 40,
                    fontWeight: FontWeight.w400)),
            Text("Cards",
                style: TextStyle(
                    color: Color.fromARGB(255, 20, 161, 27),
                    fontSize: 50,
                    fontWeight: FontWeight.w900))
          ]),
          SizedBox(height: 20),
          Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return MyCard(
                        name: 'NAME',
                        number: "NUMBER",
                        email: "EMAIL",
                        bio: "BIO",
                        color: Colors.grey);
                  })),
          SizedBox(height: 20)
        ]));
  }
}
