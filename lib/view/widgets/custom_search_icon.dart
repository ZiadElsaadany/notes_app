import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({Key? key, required this.icon}) : super(key: key);
final  IconData icon ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.06,
      width: MediaQuery.of(context).size.width*0.09,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withOpacity(0.09)
      ),
      child:  Icon(icon,size: 28,),
    );
  }
}


