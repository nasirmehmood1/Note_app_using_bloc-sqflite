import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sdf_lite_nasir_database/model/note_model.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key, required this.id});
  final int id;

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Add Note',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 35)),
            SizedBox(
              width: width * 0.9,
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    label: Text(
                  'Title',
                  style: TextStyle(fontSize: 15),
                )),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 35)),
            SizedBox(
              width: width * 0.9,
              child: TextField(
                controller: descriptionController,
                maxLines: 1,
                decoration: const InputDecoration(
                    label: Text(
                  'description',
                  style: TextStyle(fontSize: 15),
                )),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 80)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      log(widget.id);

                      final note = NoteModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          id: widget.id);

                      Navigator.pop(context, note);
                    },
                    child: const Text('Save'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
