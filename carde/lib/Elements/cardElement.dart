// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CardStack extends StatefulWidget {
  const CardStack({super.key});

  @override
  State<CardStack> createState() => _CardStackState();
}

class _CardStackState extends State<CardStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: 300,
            height: 187,
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            // Stuff Within The Card
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text Within The Card
                Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("John Smith",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Text("email@gmail.com",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("267-123-4567",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ]),
                // Picture Within The Card
                Row(children: [
                  Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 198, 236, 255),
                          borderRadius: BorderRadius.circular(20)))
                ])
              ],
            ))
      ],
    );
  }
}
