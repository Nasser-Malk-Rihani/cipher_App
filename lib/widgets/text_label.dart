// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
class TextCustom extends StatelessWidget {
  final String text;
  double? fontSize;
  TextCustom(
      this.text,
      {
        this.fontSize = 20,
        Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}
