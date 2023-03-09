// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TheCard extends StatelessWidget {
  const TheCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Container(
          padding: EdgeInsets.symmetric(vertical:25, horizontal: 35),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          // Stuff Within The Card
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text Within The Card
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("John Smith",
                      style:
                          TextStyle(fontSize: 29, fontWeight: FontWeight.bold)),
                  Text("email@gmail.com",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  Text("267-123-4567",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                ],
              ),
              // Picture Within The Card
              Container(
                  width: 120,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 111, 136, 162),
                      borderRadius: BorderRadius.circular(20)))
            ],
          )),
    );
  }
}
