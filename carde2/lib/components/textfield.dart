import 'package:flutter/material.dart';

// This requires controller, hint, and obscure.
// Controller controls the value inside
// Hint shows as the hint text
// Obscure hides the test (for passwords)
class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
        child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 194, 194, 194))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                fillColor: Colors.white,
                filled: true,
                hintText: hintText,
                hintStyle:
                    TextStyle(color: Color.fromARGB(255, 158, 158, 158)))));
  }
}
