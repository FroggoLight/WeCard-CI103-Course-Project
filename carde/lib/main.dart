import 'package:carde/Pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Carde());
}

class Carde extends StatelessWidget {
  const Carde({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
