import 'package:flutter/material.dart';
import 'package:notes_app/view/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(
          onPressed: ( ) { },
        child: Icon(Icons.add),

      ),
    );
  }
}
