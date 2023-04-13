import 'package:flutter/material.dart';

class Card {
  String name;
  String number;
  String email;
  String text;

  Card(this.name, this.number, this.email, this.text);

  editName(newName) {
    this.name = newName;
  }

  editNumber(newNumber) {
    this.number = newNumber;
  }

  editEmail(newEmail) {
    this.email = newEmail;
  }

  editText(newText) {
    this.text = newText;
  }
}
