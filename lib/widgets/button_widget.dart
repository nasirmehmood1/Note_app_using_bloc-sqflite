import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key, required this.text, required this.onpress});
  String text;
  Function() onpress;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onpress, child: Text(text));
  }
}
