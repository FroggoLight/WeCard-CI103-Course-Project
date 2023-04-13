import 'package:carde/Elements/PlaceHolderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:math' as math;

class editPage extends StatefulWidget {
  const editPage({super.key});

  @override
  State<editPage> createState() => _editPageState();
}

class _editPageState extends State<editPage> {
  // Variables for validation
  final formKey = GlobalKey<FormState>();
  String name = "";
  String number = "";
  String email = "";
  // Variables for displaying text
  String printName = "";
  String printNumber = "";
  String printEmail = "";

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
          Padding(
            padding: const EdgeInsets.all(25),
            child: Expanded(
              child: AspectRatio(
                aspectRatio: 1.59,
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      // Stuff Within The Card
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Text Within The Card
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(printName,
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                    Text(printNumber,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    Text(printEmail,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                          ),
                          // Picture Within The Card
                          Container(
                              width: 120,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20)))
                        ],
                      )),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      maxLength: 15,
                      decoration: InputDecoration(
                          labelText: "Name",
                          filled: true,
                          fillColor: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty ||
                            RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                          return "Please enter a valid name";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          printName = value;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      maxLength: 10,
                      decoration: InputDecoration(
                          labelText: "Phone Number",
                          filled: true,
                          fillColor: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty ||
                            RegExp(r'^[0-9]+$').hasMatch(value!)) {
                          return "Please enter a valid number";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          printNumber = value;
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
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                .hasMatch(value!)) {
                          return "Please enter a valid email address";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          printEmail = value;
                        });
                      }),
                )
              ],
            ),
          )
        ]),
      ),
    ]);
  }
}
