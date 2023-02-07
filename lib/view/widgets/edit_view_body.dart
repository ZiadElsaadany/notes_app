import 'package:flutter/material.dart';
import 'package:notes_app/controller/read_notes_provider.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/view/widgets/custom_app_bar.dart';
import 'package:notes_app/view/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../controller/add_note_provider.dart';
import 'colors_list_view.dart';

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
      child: SingleChildScrollView(
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
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('note edited successfully',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ));
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
          const   SizedBox(height: 20,),
             SizedBox(
                height: 35 * 2,
                child:EditNoteListView(
note: widget.note,

                )
            ),
          ],
        ),
      ),
    );
  }
}

class EditNoteListView extends StatefulWidget {
 const   EditNoteListView({Key? key, required this.note}) : super(key: key);
final NoteModel note;
  @override
  State<EditNoteListView> createState() => _EditNoteListViewState();
}

class _EditNoteListViewState extends State<EditNoteListView> {
  List<Color> colors = [
    const  Color(0xffe2cfea),
    const Color(0xffA06CD5),
    const Color(0xff6247AA),

    Colors.red,
    Colors.orange,
    Colors.cyanAccent,

    const Color(0xffE2CFEA),
    const Color(0xffA06CD5),
    const Color(0xff6247AA),
    Colors.white70,
    Colors.yellowAccent

  ] ;

 late int currentIndex ;
@override
  void initState() {
    // TODO: implement initState

  // to get index of color check note
  currentIndex=colors.indexOf(Color(widget.note.color));
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      physics:const  BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx,index)=>  GestureDetector(
          onTap: ( ) {
            currentIndex =index ;
            Provider.of<AddNoteProvider>(context,listen: false).color = colors[index];
            widget.note.color= colors[index].value;
            setState(() {});
          },
          child: ColorItem(isActive: currentIndex==index?true:false ,

            color: colors[index],
          )),
      itemCount:colors.length ,

    );
  }
}
