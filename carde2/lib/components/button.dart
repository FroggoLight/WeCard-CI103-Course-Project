import 'package:flutter/material.dart';

// Class requires a function when called. Whatever the function is, the button will do it.
class MyButton extends StatelessWidget {
  Function()? onTap;
  String text;
  Color color;
  MyButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(text,
                  style: TextStyle(
                      color: color,
                      fontSize: 17,
                      fontWeight: FontWeight.w500)))),
    );
  }
}
