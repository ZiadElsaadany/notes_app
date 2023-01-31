import 'package:flutter/material.dart';
import 'package:notes_app/controller/add_note_provider.dart';
import 'package:provider/provider.dart';
import 'add_note_form.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  const CustomBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // this widget to  prevent user's action on UI
    return   AbsorbPointer(
 absorbing: Provider.of<AddNoteProvider>(context).addLoading,
        child: const SingleChildScrollView(child: AddNoteForm()));

  }
}
