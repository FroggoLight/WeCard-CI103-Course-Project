// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../components/card.dart';

class MiddlePage extends StatefulWidget {
  MiddlePage({super.key});

  @override
  State<MiddlePage> createState() => _MiddlePageState();
}

class _MiddlePageState extends State<MiddlePage> {
  String userID = FirebaseAuth.instance.currentUser!.uid;

  Future<List<String>> getIDs() async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    List<String> ids = [];
    List<dynamic> arrayField =
        documentSnapshot.get('cardCollection') as List<dynamic>;
    ids.addAll(arrayField.map((id) => id.toString()));
    return ids;
  }

  Future<DocumentSnapshot> getData(id) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    return snapshot;
  }

  void removeCard() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 55, 55, 55),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 50),
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
              child: FutureBuilder(
            future: getIDs(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text("You Have No Cards",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold));
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  String id = snapshot.data![index];
                  return FutureBuilder<DocumentSnapshot>(
                    future: getData(id),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return MyCard(
                          name: 'Error',
                          number: '',
                          email: '',
                          bio: '',
                          color: Colors.grey,
                        );
                      }
                      if (!snapshot.hasData || !snapshot.data!.exists) {
                        return MyCard(
                          name: 'User Deleted',
                          number: '',
                          email: '',
                          bio: '',
                          color: Colors.grey,
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return MyCard(
                          name: 'Loading...',
                          number: '',
                          email: '',
                          bio: '',
                          color: Colors.grey,
                        );
                      }
                      return MyCard(
                        name: snapshot.data!.get('name') as String,
                        number: snapshot.data!.get('number') as String,
                        email: snapshot.data!.get('email') as String,
                        bio: snapshot.data!.get('bio') as String,
                        color: Colors.grey,
                      );
                    },
                  );
                },
              );
            },
          )),
          SizedBox(height: 20)
        ]));
  }
}
