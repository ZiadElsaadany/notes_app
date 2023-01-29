import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/controller/add_note_provider.dart';
import 'package:notes_app/controller/read_notes_provider.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/view/notes_view.dart';
import 'package:provider/provider.dart';

void main()  async {


  // to inti hive
  await Hive.initFlutter();

  // register note
  Hive.registerAdapter(NoteModelAdapter());

  //name of box
  await Hive.openBox<NoteModel>('notes_box');

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context)=>AddNoteProvider(),
          ),
          ChangeNotifierProvider(
            create: (context)=>ReadNotesProvider(),
          )
        ],
        child: const NotesApp(),
      ));
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp
      (
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins'
      ),
      title: 'Notes App',
      home: const NotesView(),
    );
  }
}
