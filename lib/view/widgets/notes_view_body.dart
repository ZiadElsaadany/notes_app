import 'package:flutter/material.dart';
import 'package:notes_app/view/widgets/note_item.dart';

import 'custom_app_bar.dart';
import 'notes_listview.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children:  [
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
           const CustomAppBar(title: 'Notes', icon: Icons.search),
         const Expanded(
           child: NotesListView()
         )
        ],
      ),
    );
  }
}


