import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/view/widgets/edit_view_body.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:  ( context) {
          return EditNoteViewBody();
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24  ,left: 16, right: 5),
        decoration: BoxDecoration (
          color: const Color(0xffFFCC80),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:const Text( 'Flutter Tips',
              style: TextStyle(
                fontSize: 26,
                color: Colors.black
              ),),

              subtitle:  Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('BuiLd your career with ziad elsaadany',style: TextStyle(
                  fontSize: 18,
                    color: Colors.black.withOpacity(0.5)
                ),),
              ),
              trailing: IconButton(
                onPressed: ( ) { } ,
                icon:const Icon( FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 25,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:24.0,top: 10),
              child: Text('May 21, 2022',style: TextStyle(
                  color: Colors.black.withOpacity(0.4)
              ),),
            )

          ],
        ),
      ),
    );
  }
}
