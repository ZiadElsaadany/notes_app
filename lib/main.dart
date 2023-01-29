import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/controller/add_note_provider.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/view/notes_view.dart';
import 'package:provider/provider.dart';

void main()  async {


  // to inti hive
  await Hive.initFlutter();

  //name of box
  // register note
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes_box');



  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context)=>AddNoteProvider(),
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
