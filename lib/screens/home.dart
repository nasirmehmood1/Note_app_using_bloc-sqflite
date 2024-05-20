import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sdf_lite_nasir_database/bloc/note_bloc_bloc.dart';
import 'package:flutter_sdf_lite_nasir_database/screens/note_detail_screen.dart';
import 'package:flutter_sdf_lite_nasir_database/widgets/alert_dialog.dart';
import 'package:flutter_sdf_lite_nasir_database/widgets/list_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: height * 0.94,
              width: width * 0.98,
              child: BlocBuilder<NoteBlocBloc, NoteBlocState>(
                builder: (context, state) {
                  if (state is NoteBlocLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NoteBlocLoadedState) {
                    final notes = state.listNotes;
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: notes.length,
                      physics: const ScrollPhysics(),
                      padding: const EdgeInsets.all(5),
                      itemBuilder: (context, index) {
                        final note = notes[index];
                        return GestureDetector(
                          child: ListWidget(
                            noteModel: note,
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NoteDetailScreen(note: note),
                              )),
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (hhjg) {
                                return AlertDialod(
                                  onpress: () {
                                    context
                                        .read<NoteBlocBloc>()
                                        .add(DeleteNotesEvent(id: note.id));
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  } else {
                    return ErrorWidget('error');
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.read<NoteBlocBloc>().add(AddNotesEvent(context)),
        child: const Icon(Icons.add),
      ),
    );
  }
}
