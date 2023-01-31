import 'package:flutter/material.dart';
import 'package:notes_app/controller/read_notes_provider.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/view/widgets/custom_app_bar.dart';
import 'package:notes_app/view/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);
final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
   String ? title,content;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children:  [
          const SizedBox(
            height:45 ,
          ),
          CustomAppBar(onPressed: (){
                widget.note.title = title?? widget.note.title;
                widget.note.description = content?? widget.note.description;
                // edit note
                widget.note.save();
                  Provider.of<ReadNotesProvider>(context,listen: false).fetchAllNotes();
                Navigator.pop(context);
              },
              title: 'Edit',
          icon:  Icons.done
          ),
          const SizedBox(height: 50,),
          CustomTextField(
                onChanged: ( value) {
                  title = value;
                  } ,
              hintText: widget.note.title),
          const SizedBox(height: 16,),
           CustomTextField(
              onChanged: ( value) {
                content = value;
              },
              hintText: widget.note.description, maxLines: 5),
        ],
      ),
    );
  }
}
