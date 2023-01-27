
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      cursorColor: const Color(0xff62FCD7),
      decoration: InputDecoration(
        hintText: 'Title',
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(8)
        ) ,
        enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(8) ,
          borderSide: const BorderSide(
            color: Colors.white
          )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xff62FCD7)
            )

        ),
      
      )
    );
  }
}