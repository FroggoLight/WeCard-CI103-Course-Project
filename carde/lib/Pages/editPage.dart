// ignore_for_file: prefer_const_constructors

import 'package:carde/Elements/BlankCard.dart';
import 'package:carde/Elements/PlaceHolderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:math' as math;
import '../Elements/AddButton.dart';

void main() {}

class editPage extends StatefulWidget {
  const editPage({super.key});

  @override
  State<editPage> createState() => _editPageState();
}

class _editPageState extends State<editPage> {
  String userName = "";
  String userNumber = "";
  String userEmail = "";
  String userBio = "";
  var userCard;
  _editPageState() {
    BlankCard createCard = BlankCard(
        name: userName, number: userNumber, email: userEmail, bio: userBio);
    this.userCard = createCard;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Row for top title
      Padding(
        padding: const EdgeInsets.all(40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // EditCards
            Row(
              children: const [
                Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Card',
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),

      // Edit Card
      Expanded(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          // The Edit Card

          userCard.build(context),

          // Text Fields
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(20),
                          isCollapsed: true,
                          isDense: true,
                          hintText: "Name",
                          filled: true,
                          fillColor: Colors.white),
                      onChanged: (value) {
                        setState(() {
                          userCard.editName(value);
                          userCard.build(context);
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          isCollapsed: true,
                          isDense: true,
                          hintText: "Phone Number",
                          filled: true,
                          fillColor: Colors.white),
                      onChanged: (value) {
                        setState(() {
                          userCard.editNumber(value);
                          userCard.build(context);
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          isCollapsed: true,
                          isDense: true,
                          hintText: "Email",
                          filled: true,
                          fillColor: Colors.white),
                      onChanged: (value) {
                        setState(() {
                          userCard.editEmail(value);
                          userCard.build(context);
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          isCollapsed: true,
                          isDense: true,
                          hintText: "Description",
                          filled: true,
                          fillColor: Colors.white),
                      onChanged: (value) {
                        setState(() {
                          userCard.editBio(value);
                          userCard.build(context);
                        });
                      }),
                )
              ],
            ),
          ),
          // AddButton(),
        ]),
      ),
    ]);
  }
}
