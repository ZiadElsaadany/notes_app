
import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isActive, required this.color}) : super(key: key);
final bool isActive;
final Color color  ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:6.0),
      child: isActive?  CircleAvatar(
        backgroundColor: Colors.white,
        radius: 35,
        child: CircleAvatar(
          radius: 32,
          backgroundColor: color,

        ),
      ) : CircleAvatar(
        radius: 35,
        backgroundColor: color,
      ),
    ) ;
  }
}
class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);


  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  // website --> color palette generator
  // to check colors
  List<Color> colors =const [
    Color(0xffE2CFEA),
    Color(0xffA06CD5),
    Color(0xff6247AA),
    Color(0xff102B3F),
    Color(0xffE2CFEA),
    Color(0xffA06CD5),
    Color(0xff6247AA),
  ] ;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx,index)=>  GestureDetector(
          onTap: ( ) {
          currentIndex =index ;
          setState(() {});
          },
          child: ColorItem(isActive: currentIndex==index?true:false ,

          color: colors[index],
          )),
      itemCount: colors.length ,

    );
  }
}
