
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/controller/add_note_provider.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:provider/provider.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  // to validate
  final GlobalKey<FormState> formKey =  GlobalKey();

  // to wrong input
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;


  String? title, description;

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNoteProvider>(
      builder: (context,provider,_) {
        return ModalProgressHUD(
          inAsyncCall: provider.addLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: ListView(
                  children:  [
                    Icon(
                      Icons.remove,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomTextField(
                        onChanged: (value ) {
                          title = value ;
                        },
                        hintText: 'Title'),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField
                      (
                      onChanged:  ( value) {
                        description  =value ;
                      } ,

                      hintText: 'content',
                      maxLines: 4,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTap: (){
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save();
                        provider.addNote(
                              NoteModel(title: title!, date: DateTime.now().toString(), description:description!, color: Colors.blue.value)
                          );
                          debugPrint('done');
                          Navigator.pop(context);
                        }else{
                          autoValidateMode=AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
