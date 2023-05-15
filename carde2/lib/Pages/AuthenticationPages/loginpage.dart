// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../components/button.dart';
import '../../components/textfield.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signIn() async {
    // loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    // tries to get login info. If wrong, tell user
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (error) {
      Navigator.pop(context);
      if (error.code == 'user-not-found') {
        wrongEmail();
      } else if (error.code == 'wrong-password') {
        wrongPassword();
      }
    }

    // remove loading circle
  }

  wrongEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title:
                  Text("Email Not Found", style: TextStyle(color: Colors.red)),
              backgroundColor: Colors.black);
        });
  }

  wrongPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:
                Text("Incorrect Password", style: TextStyle(color: Colors.red)),
            backgroundColor: Colors.black,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 39, 39, 39),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: 100),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("We",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 60,
                    fontWeight: FontWeight.w400)),
            Text("Card",
                style: TextStyle(
                    color: Color.fromARGB(255, 20, 161, 27),
                    fontSize: 60,
                    fontWeight: FontWeight.w900))
          ]),
          SizedBox(height: 20),
          Text("Log in or Register",
              style: TextStyle(color: Colors.white, fontSize: 20)),
          SizedBox(height: 17),
          MyTextField(
              controller: _emailController,
              hintText: "Enter Email",
              obscureText: false),
          MyTextField(
              controller: _passwordController,
              hintText: "Enter Password",
              obscureText: true),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Text("Forgot Password?",
                    style: TextStyle(color: Colors.green, fontSize: 15)),
              ],
            ),
          ),
          SizedBox(height: 50),
          MyButton(onTap: signIn, text: "Log in", color: Colors.white),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('or ', style: TextStyle(fontSize: 15, color: Colors.white)),
            GestureDetector(
              onTap: widget.showRegisterPage,
              child: Text('Register Now',
                  style: TextStyle(fontSize: 15, color: Colors.green)),
            )
          ])
        ]),
      ),
    );
  }
}
