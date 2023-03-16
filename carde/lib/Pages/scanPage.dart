// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class scanPage extends StatelessWidget {
  const scanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Top Title and Sorting Button
      Padding(
        padding: const EdgeInsets.all(40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            Row(
              children: const [
                Text(
                  'Share',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Card',
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),

            // Search Button
          ],
        ),
      ),

      // Card Stack
      Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
              image: NetworkImage(
                  'https://www.investopedia.com/thmb/LCLGYbEdJwzFQbTsFSDiM-hx42U=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/qr-code-bc94057f452f4806af70fd34540f72ad.png'))
        ]),
      ),
      Padding(
        padding: EdgeInsets.all(60.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
