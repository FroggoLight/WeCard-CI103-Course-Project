// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, avoid_unnecessary_containers

import 'package:carde/Elements/addButtonElement.dart';
import 'package:carde/Elements/cardElement.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Necessary for list of cards to works
  PageController _cardController = PageController(initialPage: 0);
  int _activeCard = 0;
  List<Widget> _cards = [];   // Creation of card list
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
                        child: PageView.builder(    // Page View for scrolling
                      controller: _cardController,
                      onPageChanged: (int card) {
                        setState(
                          () {
                            _activeCard = card;
                          },
                        );
                      },
                      scrollDirection: Axis.vertical,
                      itemCount: _cards.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _cards[index % _cards.length];   // List of cards
                      },
                    )),
                  ),
                ),
              )
            ]),
          ),
          // Add Button
          GestureDetector(    // Gesture detector that reacts to taps
              onTap: () {
                setState(() {
                  _cards.add(TheCard());
                });
              },
              child: AddButton()),
          //next page button
        GestureDetector(    // Gesture detector that reacts to taps
              onTap:() {
                Navigator.of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => Page2()
              )
            );
              },
              child: NextPage()),

        ]),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 44, 49, 58),
      body: SafeArea(
        child: Column(children: [
          GestureDetector(    // Gesture detector that reacts to taps
              onTap:() {
                Navigator.of(context)
                .pop(
            );
              },
              child: BackPage()),
TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.teal,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50)
              ),
            ),
          )
        ])
      )




      /*body: SafeArea(
        onTap: () {
          Navigator.of(context)
          .pop();

      },
      child: NextPage(),
      )) */
    );
    // TODO: implement build
    //throw UnimplementedError();
  }

}


