import 'dart:math';
import 'package:flutter/material.dart';
import 'package:security_app/Screens/screens.dart';
import 'package:security_app/widgets/widgets.dart';
class Monoalphabetic extends StatefulWidget {
  static String id = "Monoalphabetic";
  const Monoalphabetic({Key? key}) : super(key: key);

  @override
  State<Monoalphabetic> createState() => _MonoalphabeticState();
}

class _MonoalphabeticState extends State<Monoalphabetic> {
  String decryptKey = "";
  String dePlainText = "";
  String deCipherText = "";
  bool switchMode = true;
  String encryptKey = "";
  String plainText = "";
  String cipherText = "";

  generateKey(){
    encryptKey = "";
    var random = Random(26);
      while(encryptKey.length < 26) {
        for (var i = 0; i < 10; i++) {
          var rng = Random();
          if (encryptKey.contains(alphabetic[rng.nextInt(26)])) {}
          else {
            encryptKey += alphabetic[random.nextInt(26)];
          }
        }
      }
    setState(() {
      encryptKey = encryptKey;
    });
  }

  encryptString(){
    cipherText = "";
    for(int i = 0;i<plainText.length;i++){
      setState(() {
        cipherText += encryptKey[alphabetic.indexOf(plainText[i])];
      });
    }
  }

  decryptString(){
    dePlainText = "";
    for(int i = 0;i<deCipherText.length;i++){
      setState(() {
        dePlainText += alphabetic[decryptKey.indexOf(deCipherText[i])];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Monoalphabetic Cipher"),
          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ButtonCustom(!switchMode ? 'Encrypt' : "Decrypt", (){
                setState(() {
                  encryptKey = "";
                  decryptKey = "";
                  plainText = "";
                  cipherText = "";
                  deCipherText = "";
                  dePlainText = "";
                  switchMode = !switchMode;
                });
              }),
            ),
            switchMode ? encrypt() : decrypt(),
          ],
        ),
      ),
    )
    );
  }
  decrypt(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: TextCustom('Cipher Text')),
        TextFieldCustom('Cipher Text', (value){
          setState(() {
            deCipherText = value;
          });
        }),

        Center(child: TextCustom('key')),
        TextFieldCustom("Key", (value){
          setState(() {
            decryptKey = value;
          });
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonCustom('Decrypt', (){
              decryptString();
            }),
          ],
        ),
        TextCustom('Plain Text'),
        SelectableText(dePlainText,style: const TextStyle(fontSize:20),),
      ],
    );
  }
  encrypt(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: TextCustom('Plain Text')),
        TextField(
          onChanged: (value){
            setState(() {
              plainText = value;
            });
          },
          maxLength: 26,
          decoration: const InputDecoration(
              hintText: 'Plain Text at least 26 character'
          ),
        ),

        Center(child: TextCustom('key')),
        ButtonCustom('Generate Random key', (){
          generateKey();
        }),
        SelectableText(encryptKey,style: const TextStyle(fontSize:20),),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonCustom('Encrypt', (){
              encryptString();
            }),
          ],
        ),
        TextCustom('Cipher Text'),
        SelectableText(cipherText,style: const TextStyle(fontSize:20),),
      ],
    );
  }
}
//P : nasserrihaniistheman
//K : cjnhesfplgdbrwxvymkaztuioq
//C : wckkemmlpcwllkapercw