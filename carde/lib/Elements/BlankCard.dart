// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BlankCard extends StatelessWidget {
  String name;
  String number;
  String email;
  String bio;

  BlankCard(
      {super.key,
      required this.name,
      required this.number,
      required this.email,
      required this.bio});

  editName(newName) {
    this.name = newName;
  }

  editNumber(newNumber) {
    this.number = newNumber;
  }

  editEmail(newEmail) {
    this.email = newEmail;
  }

  editBio(newBio) {
    this.bio = newBio;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55),
      child: Expanded(
        child: AspectRatio(
          aspectRatio: 0.95,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              // Stuff Within The Card
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                      child: Text(this.name,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(height: 10),
                    Text(this.number,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 25,
                      child: Text(this.email,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                        child: Text(this.bio, style: TextStyle(fontSize: 15)))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
