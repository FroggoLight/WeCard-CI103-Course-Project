import 'package:carde/Elements/BlankCard.dart';
import 'package:carde/Elements/PlaceHolderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:math' as math;
import '../Elements/AddButton.dart';

import 'dart:async';
import 'dart:io';

void main() {}

class editPage extends StatefulWidget {
  editPage({super.key});
  //attempted to add a card object as part of
  //the parameters for editPage, does not work
  @override
  State<editPage> createState() => _editPageState();
}

class _editPageState extends State<editPage> {
  String userName = "";
  String userNumber = "";
  String userEmail = "";
  String userBio = "";
  var userCard;
  // final file = File("data.txt");    Attempted to use files for saving user data

  _editPageState() {
    //final contents = file.readAsLines();      <--- these two are also associated with
    //file.writeAsString("contents");                file reading
    BlankCard createCard = BlankCard(
        name: userName, number: userNumber, email: userEmail, bio: userBio);
    userCard = createCard;

    //reassigns user data by using data from an object (supposedly to be the saved data) as part of the initialization

    userName = userCard.getName();
    userNumber = userCard.getNumber();
    userEmail = userCard.getEmail();
    userBio = userCard.getBio();
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
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Name",
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
                          labelText: "Phone Number",
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
                          labelText: "Email",
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
                          labelText: "Description",
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
