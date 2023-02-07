
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/controller/add_note_provider.dart';
import 'package:notes_app/controller/read_notes_provider.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:provider/provider.dart';

import 'colors_list_view.dart';
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children:  [
                  Icon(
                    Icons.remove,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(
                    height: 10,
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
                  const SizedBox(
                    height: 35 * 2,
                    child:ColorsListView()
                  ),
                 const  SizedBox(height: 10,),
                  CustomButton(
                    isLoading: provider.addLoading,
                    onTap: (){
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                      provider.addNote(
                            NoteModel(
                                title: title!,
                                date: DateFormat.yMd().format(DateTime.now()),
                                description:description!,
                                color: Provider.of<AddNoteProvider>(context,listen: false).color?.value??

                                  const Color(0xffE2CFEA).value,
                            )
                        );
                        Provider.of<ReadNotesProvider>(context,listen: false).fetchAllNotes();
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('note added successfully',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          ),
                        ));

                        Navigator.pop(context);
                      }else{
                        autoValidateMode=AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}


