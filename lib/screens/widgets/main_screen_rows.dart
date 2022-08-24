import 'package:flutter/material.dart';

import '../../additions/my_text_style.dart';

class MainScreenRows extends StatelessWidget {
  final String section;
  final String buttonText;

  const MainScreenRows({
    Key? key,
    required this.section,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(section, style: MyTextStyle.headerText),
          TextButton(
            onPressed: (){}, //ToDo
            child: Text(buttonText, style: MyTextStyle.buttonText,),
          )
        ],
      ),
    );
  }
}
