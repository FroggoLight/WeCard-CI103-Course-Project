import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? number;
  final String? email;
  final String? bio;
  UserModel(
      {this.id,
      required this.name,
      required this.number,
      required this.email,
      required this.bio});
  toJson() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'email': email,
      'bio': bio,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      name: data['name'],
      number: data['number'],
      email: data['email'],
      bio: data['bio'],
    );
  }
}
