import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/controller/read_notes_provider.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/view/edit_note_view.dart';
import 'package:provider/provider.dart';


class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({Key? key, required this.note}) : super(key: key);
final NoteModel note  ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:  ( context) {
          return const EditNoteView();
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24  ,left: 16, right: 5),
        decoration: BoxDecoration (
          color:  Color(note.color),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text( note.title,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.black
              ),),

              subtitle:  Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(note.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                  fontSize: 18,
                    color: Colors.black.withOpacity(0.5)
                ),),
              ),
              trailing: IconButton(
                onPressed: ( ) {
                  note.delete();
                  Provider.of<ReadNotesProvider>(context,listen: false).fetchAllNotes();

                } ,
                icon:const Icon( FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 25,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:24.0,top: 10),
              child: Text(note.date,style: TextStyle(
                  color: Colors.black.withOpacity(0.4)
              ),),
            )

          ],
        ),
      ),
    );
  }
}
