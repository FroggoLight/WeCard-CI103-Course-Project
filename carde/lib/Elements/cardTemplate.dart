import 'package:flutter/material.dart';

class CardStack extends StatefulWidget {
  const CardStack({super.key});

  @override
  State<CardStack> createState() => _CardStackState();
}

class _CardStackState extends State<CardStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: Expanded(
            child: Align(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 1.59,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      color: const Color.fromARGB(255, 150, 166, 196)
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
