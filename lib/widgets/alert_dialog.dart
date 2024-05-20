import 'package:flutter/material.dart';
import 'package:flutter_sdf_lite_nasir_database/widgets/button_widget.dart';

class AlertDialod extends StatelessWidget {
  AlertDialod({super.key, required this.onpress});
  Function() onpress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: const Text(
          "Delete",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        content: const Text("Are you want to delete the note"),
        actions: [
          ButtonWidget(text: 'delete', onpress: onpress),
          ButtonWidget(
              text: 'cencel',
              onpress: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}
