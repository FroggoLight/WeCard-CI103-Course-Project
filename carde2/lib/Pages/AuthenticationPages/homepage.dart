// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../pageA.dart';
import '../pageB.dart';
import '../pageC.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(initialPage: 1);
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          children: [scannerPage(), LeftPage(), MiddlePage(), RightPage()]),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromARGB(255, 55, 55, 55),
          color: Colors.black,
          buttonBackgroundColor: Color.fromARGB(255, 19, 100, 23),
          animationDuration: Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {
              _currentPage = index;
            });
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
          },
          index: _currentPage,
          items: [
            Icon(Icons.add, color: Colors.white),
            Icon(Icons.share, color: Colors.white),
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.person, color: Colors.white)
          ]),
    );
  }
}
