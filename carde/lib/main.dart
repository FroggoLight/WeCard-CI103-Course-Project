import 'package:flutter/material.dart';

void main() {
  runApp(Carde());
}

// THE MAIN SCREEN
class Carde extends StatelessWidget {
  const Carde({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 208, 222, 228),
          body: Stack(
            children: [

              // THIS IS THE START OF THE CARD ELEMENT
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
                            duration: Duration(seconds: 1),
                            color: Color.fromARGB(255, 116, 128, 148)
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // THIS IS THE END OF THE CARD ELEMENT

            ],
          )),
    );
  }
}

// START OF PERSONAL CARD EDIT SCREEN
class SwipeRight extends StatelessWidget {
  const SwipeRight({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// START OF QR CODE SCANNING SCREEN
class SwipeLeft extends StatelessWidget {
  const SwipeLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
