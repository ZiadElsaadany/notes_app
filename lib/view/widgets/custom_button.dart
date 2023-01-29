import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap}) : super(key: key);

final void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
      width: MediaQuery.of(context).size.width*0.9,
          decoration: const BoxDecoration(
           color: Colors.white
          ),


          child:  const Text("Add",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
          )
      ),
    );
  }
}
