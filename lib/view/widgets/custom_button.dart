import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap,  this.isLoading= false}) : super(key: key);

final void Function()? onTap ;
final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
      width: MediaQuery.of(context).size.width*0.9,
          decoration: const BoxDecoration(
           color: Color(0xff62FCD7)
          ),


          child: isLoading ?  const CircularProgressIndicator(
            color: Colors.black,
          ):  const Text("Add",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
          )
      ),
    );
  }
}
