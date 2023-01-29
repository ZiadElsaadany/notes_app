import 'package:flutter/material.dart';
import 'package:notes_app/view/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/view/widgets/notes_view_body.dart';
import 'package:provider/provider.dart';

import '../controller/read_notes_provider.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ReadNotesProvider>(context,listen: false).fetchAllNotes();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(

          onPressed: ( ) {
            showModalBottomSheet(

              isScrollControlled: true,
              context: context,
              builder:
            (context) {
              return const CustomBottomSheetWidget();
            },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
            );
          },

        child: const Icon(Icons.add),

      ),
    );
  }
}

