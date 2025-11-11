import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/notes_view.dart';

import 'constants.dart';
import 'models/note_model.dart';


void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<AddNoteCubit>(
        //     create: (context) => AddNoteCubit(),
        // ),
        // BlocProvider<NotesCubit>(
        //   create: (context) => NotesCubit(),
        // ),
        BlocProvider(create: (context) => NotesCubit()),
        BlocProvider(create: (context) => AddNoteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        theme: ThemeData(brightness: Brightness.dark , useMaterial3: false
        ),
        home: const NotesView(),
      ),
    );
  }
}