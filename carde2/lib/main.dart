import 'package:flutter/material.dart';
import 'Pages/AuthenticationPages/main_page.dart';
import 'Pages/AuthenticationPages/homepage.dart';
import 'Pages/AuthenticationPages/loginpage.dart';
import 'database/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}
