// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BlankCard extends StatelessWidget {
  String name;
  String number;
  String email;
  String bio;
  String profileImage;

  BlankCard(
      {super.key,
      required this.name,
      required this.number,
      required this.email,
      required this.bio,
      required this.profileImage});

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

  editProfileImage(newImage) {
    this.profileImage = newImage;
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
                    GestureDetector(
                        //height: 35,
                        child: Text(this.name,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        onTap: () {
                          print(
                              "This indeed works somewhat"); // <- TO DO, most likely need a prompt for a textfield
                        }),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Image.asset(this.profileImage,
                          width: 100, height: 100, fit: BoxFit.cover),
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
