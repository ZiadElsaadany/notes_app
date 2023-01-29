import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/controller/add_note_provider.dart';
import 'package:provider/provider.dart';

import 'add_note_form.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  const CustomBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Consumer<AddNoteProvider>(
        builder: (context,provider,_) {
          return ModalProgressHUD(
              inAsyncCall: provider.addLoading,
              child: const AddNoteForm());
        }
      ),
    );
  }
}
