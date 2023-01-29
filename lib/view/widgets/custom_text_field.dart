
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hintText,  this.maxLines= 1, this.onChanged }) : super(key: key);

  final String hintText ;
  final int maxLines;
 final void   Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onChanged: onChanged ,
        validator: (value){
        if(value?.isEmpty ?? true) {
          return 'Field is required' ;
        }else {
          return null;
        }
    },
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