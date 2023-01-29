import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/view/notes_view.dart';

void main()  async {


  // to inti hive
  await Hive.initFlutter();

  //name of box
  await Hive.openBox('notes_box');

  runApp(const NotesApp());
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
