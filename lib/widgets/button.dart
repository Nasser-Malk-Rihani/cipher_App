import 'package:flutter/material.dart';
class ButtonCustom extends StatelessWidget {
  final String  text;
  final void Function() onPressed;
   const ButtonCustom(
      this.text,
      this.onPressed,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}
