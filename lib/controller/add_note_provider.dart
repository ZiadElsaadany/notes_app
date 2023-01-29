import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteProvider extends ChangeNotifier{
  bool addLoading = false;
addNote (NoteModel note )  {
addLoading = true;
notifyListeners() ;
try {
  var notesBox = Hive.box('notes_box');
  notesBox.add(note);
  addLoading= false;
}catch(E) {
  print (E);
}
}

}