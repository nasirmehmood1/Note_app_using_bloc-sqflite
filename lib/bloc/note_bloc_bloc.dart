import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_sdf_lite_nasir_database/database/note_provider.dart';
import 'package:flutter_sdf_lite_nasir_database/model/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/add_note_screen.dart';
part 'note_bloc_event.dart';
part 'note_bloc_state.dart';

class NoteBlocBloc extends Bloc<NoteBlocEvent, NoteBlocState> {
  NoteProvider noteProvider = NoteProvider();
  late List<NoteModel> notes;
  NoteBlocBloc() : super(NoteBlocLoadingState()) {
    _init;
    on<AddNotesEvent>((event, emit) async {
      log("note entered");
      try {
        await Navigator.push(
            event.context,
            MaterialPageRoute(
                builder: (context) => AddNoteScreen(
                      id: notes.length + 1,
                    ))).then((note) async {
          if (note != null) {
            await noteProvider.insertStudent(noteModel: note).whenComplete(() {
              notes.add(note);
              emit(NoteBlocLoadedState(listNotes: notes));
            });
          }
        });

        log("success");
      } catch (e) {
        log(e.toString());
        emit(const NoteBlocErrorState(message: "message"));
      }
      log("note left");
    });
    on<UpdateNotesEvent>((event, emit) async {
      try {
        await noteProvider.updateStudent(note: event.noteModel);
      } catch (e) {
        emit(const NoteBlocErrorState(message: "message"));
      }
    });
    on<DeleteNotesEvent>((event, emit) async {
      try {
        bool isDeleted = await noteProvider.deleteStudent(id: event.id);
        if (isDeleted) {
          List<NoteModel> noteList = await noteProvider.fetchStudents();
          log(isDeleted.toString());
          emit(NoteBlocLoadedState(listNotes: noteList));
        }
      } catch (e) {
        emit(const NoteBlocErrorState(message: "message"));
      }
    });
  }

  get _init async {
    try {
      await noteProvider.fetchStudents().then((value) async {
        notes = await noteProvider.fetchStudents();
        emit(NoteBlocLoadedState(listNotes: notes));
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
