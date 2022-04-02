import 'package:flutter/material.dart';
class ListCards extends StatelessWidget {
  final String title;
  final Function() onTap;
  const ListCards({
    this.title = "",
    required this.onTap,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(title),
      ),
    );
  }
}
