import 'package:flutter/material.dart';

class Card {
  String name;
  String number;
  String email;
  String description;

  Card(this.name, this.number, this.email, this.description);

  editName(newName) {
    this.name = newName;
  }

  getName() {
    return this.name;
  }

  editNumber(newNumber) {
    this.number = newNumber;
  }

  getNumber() {
    return this.number;
  }

  editEmail(newEmail) {
    this.email = newEmail;
  }

  getEmail() {
    return this.email;
  }

  editDescription(newDescription) {
    this.description = newDescription;
  }

  getDescription() {
    return this.description;
  }

// To Do: Add font color and style setters and getters
}
