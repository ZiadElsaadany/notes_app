import 'package:flutter/material.dart';
import 'package:notes_app/view/widgets/custom_app_bar.dart';
import 'package:notes_app/view/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: const [
          SizedBox(
            height:45 ,
          ),
          CustomAppBar(title: 'Edit',
          icon:  Icons.done),
          SizedBox(height: 50,),
          CustomTextField(hintText: 'Title'),
          SizedBox(height: 16,),
          CustomTextField(hintText: 'Content', maxLines: 5),
        ],
      ),
    );
  }
}
