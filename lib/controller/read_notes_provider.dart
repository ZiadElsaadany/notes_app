import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/note_model.dart';

class ReadNotesProvider extends ChangeNotifier{


  List<NoteModel>  allNotes =[ ]   ;

  fetchAllNotes () async{
    try {
      var notesBox= Hive.box<NoteModel>('notes_box');
    allNotes =  notesBox.values.toList();
    notifyListeners() ;

    } catch (e) {
      debugPrint(e.toString());
    }
  }
}