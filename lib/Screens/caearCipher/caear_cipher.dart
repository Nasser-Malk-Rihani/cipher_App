import 'package:flutter/material.dart';
import 'package:security_app/Screens/screens.dart';
import 'package:security_app/widgets/widgets.dart';
class CaearCipher extends StatefulWidget {
  static String id = "EncryptScreen";
  const CaearCipher({Key? key}) : super(key: key);

  @override
  State<CaearCipher> createState() => _CaearCipherState();
}

class _CaearCipherState extends State<CaearCipher> {
  int encryptKey = 0;
  String plainText = "";
  String cipherText = "";

  incrementCipher(){
    cipherText = "";
    int len = plainText.length;
    int index;
    for(int i = 0; i < len;i++){
      index = alphabetic.indexOf(plainText[i]);
      index = index + encryptKey;
      while(index < 0 || index > 25){
        index %= 26;
      }
      setState(() {
        cipherText += alphabetic[index];
      });
    }
  }

  decrementCipher(){
    cipherText = "";
    int len = plainText.length;
    int index;
    for(int i = 0; i < len;i++){
      index = alphabetic.indexOf(plainText[i]);
      index -= encryptKey;
      while(index < 0 || index > 25){
        index %= 26;
      }
      setState(() {
        cipherText += alphabetic[index];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Caear Cipher"),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: TextCustom('key')),
                TextFieldCustom('Encrypt Key', (value){
                  setState(() {
                    encryptKey = int.parse(value == '' ? "0" : value);
                  });
                }
                ),
                Center(child: TextCustom('Plain Text')),
                TextFieldCustom('Plain Text', (value){
                  setState(() {
                    plainText = value;
                  });
                }
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonCustom('Encrypt', (){
                      incrementCipher();
                    }),
                    ButtonCustom('Decrypt', (){
                      decrementCipher();
                    }),
                  ],
                ),
                TextCustom('Cipher Text'),
                SelectableText(cipherText,style: const TextStyle(fontSize:20),),
              ],
            ),
          ),
        )
    );
  }
}
