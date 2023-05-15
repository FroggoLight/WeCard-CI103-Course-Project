import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/button.dart';
import '../../components/textfield.dart';
import '../../database/userRepository.dart';
import '../../database/usermodel.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final userRepository = Get.put(UserRepository());
  final blankUser = UserModel(name: '', number: '', email: '', bio: '');
  Future signUp() async {
    if (passwordMatch()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } else {
      return passwordNotMatch();
    }
  }

  bool passwordMatch() {
    if (_passwordController.text == _confirmPasswordController.text) {
      return true;
    } else {
      return false;
    }
  }

  passwordNotMatch() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Passwords Do Not Match",
                  style: TextStyle(color: Colors.red)),
              backgroundColor: Colors.black);
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
          Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 20)),
          SizedBox(height: 17),
          MyTextField(
              controller: _emailController,
              hintText: "Enter Email",
              obscureText: false),
          MyTextField(
              controller: _passwordController,
              hintText: "Enter Password",
              obscureText: true),
          MyTextField(
              controller: _confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: true),
          SizedBox(height: 50),
          MyButton(onTap: signUp, text: "Register", color: Colors.white),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('or ', style: TextStyle(fontSize: 15, color: Colors.white)),
            GestureDetector(
              onTap: widget.showLoginPage,
              child: Text('Login',
                  style: TextStyle(fontSize: 15, color: Colors.green)),
            )
          ])
        ]),
      ),
    );
    ;
  }
}
