import 'package:flutter/material.dart';
import 'package:security_app/Screens/screens.dart';
import 'package:security_app/widgets/widgets.dart';
class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          ListCards(
            title: 'caesar cipher',
              onTap: (){
                Navigator.pushNamed(context, CaearCipher.id);
          }
          ),
          ListCards(
            title: 'Monoalphabetic Cipher ',
              onTap: (){
                Navigator.pushNamed(context, Monoalphabetic.id);
          }
          ),
          ListCards(
            title: 'Playfair Cipher ',
              onTap: (){
                Navigator.pushNamed(context, Playfair.id);
          }
          ),
        ],
      ),
    )
    );
  }
}
