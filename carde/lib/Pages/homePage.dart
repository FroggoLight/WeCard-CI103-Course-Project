// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carde/Elements/addButtonElement.dart';
import 'package:carde/Elements/cardElement.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 49, 58),
      body: SafeArea(
        child: Column(children: [
          // Top Title and Sorting Button
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title
                Row(
                  children: const [
                    Text(
                      'My',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Cards',
                      style: TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                // Search Button
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.manage_search_rounded,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // Card Stack
          Expanded(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // The Card Itself
              Padding(
                padding: const EdgeInsets.all(25),
                child: Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.59,
                    child: Container(
                        child: PageView(
                            scrollDirection: Axis.vertical,
                            children: [TheCard(), TheCard(), TheCard(), TheCard(), TheCard()])),
                  ),
                ),
              )
            ]),
          ),
          // Add Button
          AddButton(),
        ]),
      ),
    );
  }
}
