// ignore_for_file: curly_braces_in_flow_control_structures, unused_local_variable
import 'package:flutter/material.dart';
import 'package:security_app/main.dart';
import 'package:security_app/widgets/button.dart';
import 'package:security_app/widgets/text_fel.dart';
import 'package:security_app/widgets/text_label.dart';
class Playfair extends StatefulWidget {
  static String id = "Playfair";
  const Playfair({Key? key}) : super(key: key);

  @override
  State<Playfair> createState() => _PlayfairState();
}

class _PlayfairState extends State<Playfair> {
  String plainText = "";
  String pairedText = "";
  String encryptedText = "";
  String encryptKey = "";
  List<String> list1 = ["","","","",""];
  List<String> list2 = ["","","","",""];
  List<String> list3 = ["","","","",""];
  List<String> list4 = ["","","","",""];
  List<String> list5 = ["","","","",""];
  late List<List> fullMatrix;
  bool result = false;
  removeDuplicate(String plainText)
  {
    String temp = "";
    for(int i = 0;i<plainText.length;i++){
      !temp.contains(plainText[i]) ? temp += plainText[i] : null;
    }
    return temp;
  }

  static String removeWhiteSpace(List<String> list, String key){
    List<String> tempList = [];
    for (int i = 0; i < key.length; i++) {
      tempList.add(key[i]);
    }
    key = "";
    for (int i = 0; i < tempList.length; i++) {
      for (int j = 0; j < list.length; j++) {
        if (tempList[i] == list[j]) {
          tempList[i] = ' ';
        }
      }
    }

    for (int i = 0; i < tempList.length; i++) {
      key += tempList[i];
    }
    key = key.replaceAll(" ", "");
    return key;
  }
  static String makePair(String plainText) {
    String secondAlpha = "xyzabcdefghijklmnopqrstuvw";
    int secondAlphaCounter = 0;
    String pairedString = "";
    for (int i = 0; i < plainText.length; i++) {
      if (plainText[i] == ' ') {
        continue;
      }
      else {
        pairedString += plainText[i];
      }
      if (i < plainText.length - 1)
        if (plainText[i] == plainText[i + 1]) {
          pairedString += secondAlpha[secondAlphaCounter];
          secondAlphaCounter++;
        }
    }
    if (pairedString.length % 2 != 0) {
      pairedString += "x";
    }
    return pairedString;
  }
  static String encrypt(String pt, x)
  {
    List<String> ch= [];
    for (int i = 0; i < pt.length; i++) {
      ch.add(pt[i]);
    }
    List<int> a = [0,0,0,0];
    for (int i = 0; i < pt.length; i += 2) {
      if (i < pt.length - 1) {
        a = findIJ(pt[i], pt[i+1],x);
        if (a[0] == a[2]) {
          ch[i] = x[a[0]][a[1]];
          ch[i + 1] = x[a[0]][a[3]];
        }
        else if (a[1] == a[3]) {
          ch[i] = x[a[0]][a[1]];
          ch[i + 1] = x[a[2]][a[1]];
        }
        else {
          ch[i] = x[a[0]][a[3]];
          ch[i + 1] = x[a[2]][a[1]];
        }
      }
    }
    pt = "";
    for(int i = 0;i < ch.length;i++){
      pt += ch[i].toString();
    }
    return pt;
  }

  static List<int> findIJ( a,  b,  x){
    List<int> y = [0,0,0,0];
    if (a == 'j') {
      a = 'i';
    } else if (b == 'j') {
      b = 'i';
    }
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        if (x[i][j] == a) {
          y[0] = i;
          y[1] = j;
        }
        else if (x[i][j] == b) {
          y[2] = i;
          y[3] = j;
        }
      }
    }
    if (y[0] == y[2]) {
      y[1] += 1;
      y[3] += 1;
    }
    else if (y[1] == y[3]) {
      y[0] += 1;
      y[2] += 1;
    }
    for (int i = 0; i < 4; i++) {
      y[i] %= 5;
    }
    return y;
  }
  createKey(key){
    List<String> ch = [];
    for (int i = 0; i < key.length; i++) {
      ch.add(key[i]);
    }
    String st = alphabetic;
    st = removeWhiteSpace(ch, st);
    List<String> c = [];
    for (int i = 0; i < st.length; i++) {
      c.add(st[i]);
    }
    int indexOfSt = 0, indexOfKey = 0;
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        if (indexOfKey < key.length) {
          fullMatrix[i][j] = ch[indexOfKey++];
        } else {
          fullMatrix[i][j] = c[indexOfSt++];
        }
      }
    }
    setState(() {
      fullMatrix=fullMatrix;
    });
  }
  startProcesses(){
    if(pairedText != "" || encryptKey != ""){
      pairedText="";
      String pt = plainText;
      String key = encryptKey;
      key = removeDuplicate(key);
      createKey(key);
      pt = makePair(pt);
      setState(() {
        for(int i = 0;i<pt.length;i++){
          if(i%2==0){
            pairedText += ",";
            pairedText += pt[i];

          }else{
            pairedText += pt[i];
          }
        }
        pairedText = pairedText.replaceFirst(",", "");
      });
      pt = encrypt(pt, fullMatrix);
      setState(() {
        encryptedText = pt;
        result = true;
      });
    }
    else{
      if(plainText == ""){
        showMessage("please enter the plain text");
      }
      else if(encryptKey == ""){
        showMessage("please enter the key");
      }
    }
  }
  showMessage(txt) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("ERROR",style: TextStyle(color: Colors.red),),
            content:
            TextCustom(
              txt
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("ok")
              ),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    fullMatrix = [list1,list2,list3,list4,list5];
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("Playfair Cipher"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldCustom("plain Text", (String value){
              setState(() {
                plainText = value.toLowerCase();
              });
            }),
            TextFieldCustom("Cypher Key", (value){
              setState(() {
                String pt = plainText;
                String key = encryptKey;
                key = removeDuplicate(key);
                createKey(key);
                encryptKey = value != "" ? value : alphabetic;

              });
            }),
            ButtonCustom('Encrypt', (){
              startProcesses();
            }),
            result ? showResult() : const Text('')
          ],
        ),
      ),
    ));
  }
  showResult(){
    return Column(
      children: [
        TextCustom("text after paring : " + pairedText),
        TextCustom("cipher text : "+encryptedText.toUpperCase()),
        displayingKeyArray(list1),
        displayingKeyArray(list2),
        displayingKeyArray(list3),
        displayingKeyArray(list4),
        displayingKeyArray(list5),
      ],
    );
  }
  displayingKeyArray(List<String> list){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextCustom("["),
          TextCustom(list[0]),
          TextCustom(list[1]),
          TextCustom(list[2]),
          TextCustom(list[3]),
          TextCustom(list[4]),
          TextCustom("]"),
        ],
      ),
    );
  }
}