import 'package:flutter/material.dart';

class BlankCard extends StatelessWidget {
  String name;
  String number;
  String email;
  String bio;

  BlankCard(
      {super.key,
      required this.name,
      required this.number,
      required this.email,
      required this.bio});

  editName(newName) {
    this.name = newName;
  }

  editNumber(newNumber) {
    this.number = newNumber;
  }

  editEmail(newEmail) {
    this.email = newEmail;
  }

  editBio(newBio) {
    this.bio = newBio;
  }

  getName() {
    return this.name;
  }

  getNumber() {
    return this.number;
  }

  getEmail() {
    return this.email;
  }

  getBio() {
    return this.bio;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Expanded(
        child: AspectRatio(
          aspectRatio: 1.59,
          child: Container(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                // Stuff Within The Card
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text Within The Card
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(this.name,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              Text(this.number,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              Text(this.email,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              Text(this.bio, style: TextStyle(fontSize: 10))
                            ],
                          ),
                        )
                      ],
                    ),
                    // Picture Within The Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                          width: 130,
                          height: 175,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20))),
                    )
                  ],
                )),
          )),
        ),
      ),
    );
  }
}
