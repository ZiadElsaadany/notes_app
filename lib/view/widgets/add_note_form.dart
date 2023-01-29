
import 'package:flutter/material.dart';

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
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children:  [
            Icon(
              Icons.remove,
              color: Colors.grey[600],
            ),
            const SizedBox(
              height: 32,
            ),
            Flexible(child:
            CustomTextField(
                onChanged: (value ) {
                  title = value ;
                },
                hintText: 'Title')),
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
                }else{
                  autoValidateMode=AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
