// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String hintText;
  final onChanged;
  const TextFieldCustom(
      this.hintText,
      this.onChanged,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
