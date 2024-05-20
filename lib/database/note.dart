import 'package:flutter_sdf_lite_nasir_database/database/note_provider.dart';
import 'package:sqflite/sqflite.dart';

class Note {
  static Future<Database> database() async {
    final path = await getDatabasesPath();
    Database database = await openDatabase(
      'path : $path',
      version: 1,
      onCreate: (db, version) {
        db.execute(NoteProvider.createTable);
      },
    );
    return database;
  }
}
