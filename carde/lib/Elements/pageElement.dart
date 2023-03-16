// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.all(60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
  }
}











/* onPressed:() {
          Navigator.of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => Page2()
              )
            );
        },
        child: Text("open page 2"),

      ),