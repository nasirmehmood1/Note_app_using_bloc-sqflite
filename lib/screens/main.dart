import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sdf_lite_nasir_database/bloc/note_bloc_bloc.dart';
import 'package:flutter_sdf_lite_nasir_database/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NoteBlocBloc>(
            create: (context) => NoteBlocBloc(),
            child: const MyHomePage(title: 'Note app'),
          ),
        ],
        child: const MyHomePage(title: 'Note app'),
      ),
    );
  }
}
