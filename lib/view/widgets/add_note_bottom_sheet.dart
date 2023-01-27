import 'package:flutter/material.dart';
import 'package:notes_app/view/widgets/custom_text_field.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  const CustomBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
CustomTextField(),
        ],
      ),
    );
  }
}


