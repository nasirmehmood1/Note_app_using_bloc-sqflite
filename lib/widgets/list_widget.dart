import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sdf_lite_nasir_database/model/note_model.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    final width = MediaQuery.of(context).size.width;
    final List<Color> circleColors = [
      Colors.red.shade200,
      Colors.blue.shade200,
      Colors.green.shade200,
      Colors.amber.shade100,
      Colors.deepOrange.shade400,
    ];
    Color randomColourGenerator() {
      return circleColors[Random().nextInt(5)];
    }

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: height * 0.2,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: randomColourGenerator(),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Text(
              noteModel.title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              noteModel.description,
              overflow: TextOverflow.ellipsis,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
