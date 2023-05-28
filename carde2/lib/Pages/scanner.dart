import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/textfield.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class scannerPage extends StatefulWidget {
  scannerPage({super.key});

  @override
  State<scannerPage> createState() => _scannerPageState();
}

class _scannerPageState extends State<scannerPage> {
  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Scaffold(
              body: Stack(alignment: Alignment.center, children: <Widget>[
        buildQrView(context),
      ])));

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
  }
}
