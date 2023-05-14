// ignore_for_file: prefer_const_constructors
import "dart:io";

import "package:image_picker/image_picker.dart";
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
  final nameKey = GlobalKey<FormState>();
  final numKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormState>();

  String userName = "";
  String userNumber = "";
  String userEmail = "";
  String userBio = "";
  File userImage = File("test.txt");
  var userCard;
  _editPageState() {
    BlankCard createCard = BlankCard(
        name: userName,
        number: userNumber,
        email: userEmail,
        bio: userBio,
        image: userImage);
    this.userCard = createCard;
  }

  Future selectImage(ImageSource source) async {
    // ignore: unused_local_variable
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? img = File(image.path);
    setState(() {
      userImage = img;
      userCard.editImage(userImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: nameKey,
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Name",
                            filled: true,
                            fillColor: Colors.white),
                        validator: (value) {
                          if (!RegExp(r"^[a-z A-Z,\',\-]+$").hasMatch(value!)) {
                            return "(Invalid Name)";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          nameKey.currentState!.validate();
                          setState(() {
                            userCard.editName(value);
                            userCard.build(context);
                          });
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: numKey,
                    child: TextFormField(
                        maxLength: 11,
                        decoration: InputDecoration(
                            labelText: "Phone Number",
                            filled: true,
                            fillColor: Colors.white),
                        validator: (value) {
                          if ((!RegExp(r"^[0-9]{10,11}").hasMatch(value!))) {
                            return "(Invalid Number)";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          numKey.currentState!.validate();
                          setState(() {
                            userCard.editNumber(value);
                            userCard.build(context);
                          });
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: emailKey,
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            filled: true,
                            fillColor: Colors.white),
                        validator: (value) {
                          if ((!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}")
                              .hasMatch(value!))) {
                            return "(Invalid Email)";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          emailKey.currentState!.validate();
                          setState(() {
                            userCard.editEmail(value);
                            userCard.build(context);
                          });
                        }),
                  ),
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
                ),
                ElevatedButton(
                    child: Text("Hi"),
                    onPressed: () {
                      selectImage(ImageSource.gallery);
                    })
              ],
            ),
          ),
          // AddButton(),
        ]),
      ),
    ]);
  }
}
