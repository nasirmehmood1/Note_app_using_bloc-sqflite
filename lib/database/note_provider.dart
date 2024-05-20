import 'package:flutter_sdf_lite_nasir_database/database/note.dart';
import 'package:flutter_sdf_lite_nasir_database/model/note_model.dart';
import 'package:sqflite/sqflite.dart';

class NoteProvider {
  static NoteProvider? _noteProvider;
  NoteProvider.internal();
  factory NoteProvider() {
    return _noteProvider ?? NoteProvider.internal();
  }

  static const String tableName = 'note';
  static const String titleColumn = 'title';
  static const String descriptionColumn = 'description';
  static const String idColumn = 'id';

  static const String createTable =
      'CREATE TABLE $tableName($idColumn INTEGER PRIMARY KEY ,$titleColumn TEXT ,$descriptionColumn TEXT)';
  static const String dropTable = 'DROP TABLE $tableName';

  Future<bool> insertStudent({required NoteModel noteModel}) async {
    Database database = await Note.database();
    int effectedRows = await database.insert(tableName, noteModel.toMap());
    return effectedRows > 0;
  }

  Future<List<NoteModel>> fetchStudents() async {
    Database database = await Note.database();
    List<NoteModel> note = (await database.query(tableName))
        .map((e) => NoteModel.fromMap(e))
        .toList();
    return note;
  }

  Future<bool> updateStudent({required NoteModel note}) async {
    Database database = await Note.database();
    int effectedRows = await database.update(tableName, note.toMap(),
        where: '$idColumn=?', whereArgs: [note.id]);
    return effectedRows > 0;
  }

  Future<bool> deleteStudent({required int id}) async {
    Database database = await Note.database();
    int effectedRows =
        await database.delete(tableName, where: '$idColumn=?', whereArgs: [id]);
    return effectedRows > 0;
  }
}
