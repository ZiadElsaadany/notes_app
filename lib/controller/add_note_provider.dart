import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteProvider extends ChangeNotifier{
  bool addLoading = false;
addNote(NoteModel note ) async {
try {
  addLoading = true;
  notifyListeners();
  print ('loading') ;
  var notesBox = Hive.box<NoteModel>('notes_box');
  await notesBox.add(note);
  print ('add done ' );
  addLoading= false;
  notifyListeners();
}catch(E) {
  addLoading= false;
print(E);
notifyListeners();
}
notifyListeners();
}

}