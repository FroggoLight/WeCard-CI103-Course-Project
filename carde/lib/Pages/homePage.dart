// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carde/Elements/AddButton.dart';
import 'package:carde/Elements/PlaceHolderCard.dart';
import 'package:carde/Pages/editPage.dart';
import 'package:carde/Pages/scanPage.dart';
import 'package:flutter/material.dart';
import 'package:carde/Functions/searchBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Page controller for card list scroll
  PageController _cardController = PageController(initialPage: 0);
  int _activeCard = 0;
  List<Widget> _cards = [];
  // Page controller for main pages
  PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 49, 58),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: [
            scanPage(),
            Column(children: [
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
                    GestureDetector(
                      onTap: () {
                        showSearch(context: context, delegate: CustomSearch());
                      },
                      child: const Icon(
                        Icons.manage_search_rounded,
                        color: Colors.white,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
              ),

              // Card Stack
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // The Card Itself
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Expanded(
                          child: AspectRatio(
                            aspectRatio: 1.59,
                            child: Container(
                                child: PageView.builder(
                              // Page View for scrolling cards
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
                                return _cards[
                                    index % _cards.length]; // List of cards
                              },
                            )),
                          ),
                        ),
                      )
                    ]),
              ),
              // Add Button
              GestureDetector(
                  // Gesture detector that reacts to taps
                  onTap: () {
                    setState(() {
                      _cards.add(PlaceHolder());
                    });
                  },
                  child: AddButton()),
            ]),
            // Start of second page
            editPage(),
          ],
        ),
      ),
    );
  }
}
