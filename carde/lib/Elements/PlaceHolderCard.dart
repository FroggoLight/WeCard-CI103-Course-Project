// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dart:math' as math;

class PlaceHolder extends StatelessWidget {
  const PlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          // Stuff Within The Card
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text Within The Card
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Your Name",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Color((math.Random().nextDouble() * 0xFFFFFF)
                                  .toInt())
                              .withOpacity(1.0),
                          borderRadius: BorderRadius.circular(20))),
                  SizedBox(height: 20),
                  Text("email@gmail.com",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  Text("267-123-4567",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text("Bio or Other info",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.normal)),
                ],
              ),
              // Picture Within The Card
            ],
          )),
    );
  }
}
