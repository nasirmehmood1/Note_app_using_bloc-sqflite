part of 'note_bloc_bloc.dart';

@immutable
sealed class NoteBlocEvent {}

class FetchNotesEvent extends NoteBlocEvent {}

class AddNotesEvent extends NoteBlocEvent {
  final BuildContext context;
  AddNotesEvent(this.context);
}

class UpdateNotesEvent extends NoteBlocEvent {
  final NoteModel noteModel;
  UpdateNotesEvent({required this.noteModel});
}

class DeleteNotesEvent extends NoteBlocEvent {
  final int id;
  DeleteNotesEvent({required this.id});
}
