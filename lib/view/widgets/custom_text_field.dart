
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hintText,  this.maxLines= 1 }) : super(key: key);

  final String hintText ;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      maxLines: maxLines,
      cursorColor: const Color(0xff62FCD7),
      decoration: InputDecoration(
        hintText: hintText,
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