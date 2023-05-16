// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class scanPage extends StatelessWidget {
  //const scanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
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
            
            QRCodeScreen(),
          ],
        ),
      ),
    ]);


}

}


class QRCodeScreen extends StatefulWidget {
  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
   
  final qrTextController = TextEditingController();
  String qrData = '';

  @override
  void dispose() {
    qrTextController.dispose();
    super.dispose();
  }

  void generateQRCode() {
    setState(() {
      qrData = qrTextController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
                    mainAxisAlignment: MainAxisAlignment.center,

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
          Padding(
            
            padding: const EdgeInsets.all(16.0),
            
            child: TextField(
              controller: qrTextController,
              decoration: InputDecoration(
                hintText: 'Enter text or URL',
                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: generateQRCode,
            child: Text('Generate QR Code'),
          ),
          SizedBox(height: 20),
          Center(
            child: qrData.isEmpty
                ? Text('No data to display')
                : QrImage(
                    data: qrData,
                    version: QrVersions.auto,
                    size: 200.0,
                    backgroundColor: Colors.white,
                  ),
          ),
        ],
      );
    
  }
}
