// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/card.dart';
import '../components/textfield.dart';

class RightPage extends StatefulWidget {
  RightPage({super.key});

  @override
  State<RightPage> createState() => _RightPageState();
}

class _RightPageState extends State<RightPage> {
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _emailController = TextEditingController();
  final _bioController = TextEditingController();
  final _loadingController = TextEditingController();
  Color color = Colors.grey;
  String userID = FirebaseAuth.instance.currentUser!.uid;

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void saveCard() async {
    DocumentReference userDocRef =
        await FirebaseFirestore.instance.collection('users').doc(userID);
    setState(() {
      userDocRef.set({
        'name': _nameController.text.trim(),
        'number': _numberController.text.trim(),
        'email': _emailController.text.trim(),
        'bio': _bioController.text.trim()
      }, SetOptions(merge: true));
    });
  }

  Future<DocumentSnapshot> getData() async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    return snapshot;
  }

  void changeColor() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 55, 55, 55),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(height: 50),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Edit",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 40,
                    fontWeight: FontWeight.w400)),
            Text("Card",
                style: TextStyle(
                    color: Color.fromARGB(255, 20, 161, 27),
                    fontSize: 50,
                    fontWeight: FontWeight.w900))
          ]),
          SizedBox(height: 15),
          GestureDetector(
            onTap: changeColor,
            child: FutureBuilder<DocumentSnapshot>(
                future: getData(),
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
                      color: color);
                }),
          ),
          SizedBox(height: 15),
          Expanded(
              child: FutureBuilder<DocumentSnapshot>(
            future: getData(),
            builder: (context, snapshot) {
              _nameController.text = snapshot.data!.get('name') as String;
              _numberController.text = snapshot.data!.get('number') as String;
              _emailController.text = snapshot.data!.get('email') as String;
              _bioController.text = snapshot.data!.get('bio') as String;
              if (snapshot.hasError) {
                return ListView(
                  children: [
                    MyTextField(
                        controller: _loadingController,
                        hintText: "Display Name",
                        obscureText: false),
                    MyTextField(
                        controller: _loadingController,
                        hintText: "Display Number",
                        obscureText: false),
                    MyTextField(
                        controller: _loadingController,
                        hintText: "Display Email",
                        obscureText: false),
                    MyTextField(
                        controller: _loadingController,
                        hintText: "Other Contact Information",
                        obscureText: false),
                    SizedBox(height: 10),
                    MyButton(
                        onTap: saveCard,
                        text: "Save Information",
                        color: Colors.white),
                    SizedBox(height: 30),
                    MyButton(
                        onTap: signOut, text: "Log Out", color: Colors.red),
                    SizedBox(height: 50),
                  ],
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ListView(
                  children: [
                    MyTextField(
                        controller: _loadingController,
                        hintText: "Display Name",
                        obscureText: false),
                    MyTextField(
                        controller: _loadingController,
                        hintText: "Display Number",
                        obscureText: false),
                    MyTextField(
                        controller: _loadingController,
                        hintText: "Display Email",
                        obscureText: false),
                    MyTextField(
                        controller: _loadingController,
                        hintText: "Other Contact Information",
                        obscureText: false),
                    SizedBox(height: 10),
                    MyButton(
                        onTap: saveCard,
                        text: "Save Information",
                        color: Colors.white),
                    SizedBox(height: 30),
                    MyButton(
                        onTap: signOut, text: "Log Out", color: Colors.red),
                    SizedBox(height: 50),
                  ],
                );
              }

              return ListView(
                children: [
                  MyTextField(
                      controller: _nameController,
                      hintText: "Display Name",
                      obscureText: false),
                  MyTextField(
                      controller: _numberController,
                      hintText: "Display Number",
                      obscureText: false),
                  MyTextField(
                      controller: _emailController,
                      hintText: "Display Email",
                      obscureText: false),
                  MyTextField(
                      controller: _bioController,
                      hintText: "Other Contact Information",
                      obscureText: false),
                  SizedBox(height: 10),
                  MyButton(
                      onTap: saveCard,
                      text: "Save Information",
                      color: Colors.white),
                  SizedBox(height: 30),
                  MyButton(onTap: signOut, text: "Log Out", color: Colors.red),
                  SizedBox(height: 50),
                ],
              );
            },
          ))
        ]));
  }
}
