part of 'note_bloc_bloc.dart';

@immutable
sealed class NoteBlocState {
  const NoteBlocState();
}

// final class NoteBlocInitialState extends NoteBlocState {}

final class NoteBlocLoadingState extends NoteBlocState {}

final class NoteBlocLoadedState extends NoteBlocState {
  final List<NoteModel> listNotes;

  const NoteBlocLoadedState({required this.listNotes});
}

final class NoteBlocErrorState extends NoteBlocState {
  final String message;
  const NoteBlocErrorState({required this.message});
}
