import 'package:flutter/material.dart';
import 'package:security_app/Screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomeScreen.id : (context) => const HomeScreen(),
        CaearCipher.id : (context) => const CaearCipher(),
        Monoalphabetic.id : (context) => const Monoalphabetic(),
        Playfair.id : (context) => const Playfair(),

      },
      initialRoute:HomeScreen.id,
    );
  }
}
var title = "Cipher App";
String alphabetic = 'abcdefghijklmnopqrstuvwxyz';
