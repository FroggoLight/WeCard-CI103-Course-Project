// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCard extends StatelessWidget {
  String name;
  String number;
  String email;
  String bio;
  Color color;
  MyCard(
      {super.key,
      required this.name,
      required this.number,
      required this.email,
      required this.bio,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 17),
      child: AspectRatio(
          aspectRatio: 1.598,
          child: Container(
              decoration: BoxDecoration(
                  color: this.color, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                    child: SizedBox(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name,
                            style: GoogleFonts.bebasNeue(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        Text(number,
                            style: GoogleFonts.bebasNeue(fontSize: 17)),
                        Text(email, style: GoogleFonts.bebasNeue(fontSize: 17)),
                        Text(bio, style: GoogleFonts.bebasNeue(fontSize: 17))
                      ],
                    )),
                  ),
                  Expanded(
                      child: SizedBox(
                          child: Image.asset(
                    'lib/images/profilePicIcon.jpg',
                  )))
                ]),
              ))),
    );
  }
}
