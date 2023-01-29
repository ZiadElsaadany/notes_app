import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: ( context ,index) {
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: CustomNoteItem(note: NoteModel(title: "ziad",color:Colors.black.value ,description: "",date: ""),),
        );
      } ,
        itemCount: 10,
      ),
    ) ;
  }
}