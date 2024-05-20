import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sdf_lite_nasir_database/model/note_model.dart';

class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    final width = MediaQuery.of(context).size.width;
    final List<Color> circleColors = [
      Colors.red.shade200,
      Colors.blue.shade200,
      Colors.green.shade200,
      Colors.amber.shade100
    ];
    Color randomColourGenerator() {
      return circleColors[Random().nextInt(4)];
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            'Detail Screen',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.all(20),
            color: randomColourGenerator(),
            alignment: Alignment.topLeft,
            child: Column(children: [
              const Padding(padding: EdgeInsets.only(top: 40)),
              Row(
                children: [
                  const Text(
                    'Title :',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                    note.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  const Text(
                    'Title :',
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                    note.description,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ],
              )
            ]),
          ),
        ));
  }
}
