import 'package:flutter/material.dart';

import 'consts.dart';


class MyTextStyle {
  static const discountPrice = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'MarkPro');
  static const fullPrice = TextStyle(color: Color(0xff999Da0), fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'MarkPro', decoration: TextDecoration.lineThrough);
  static const nameText = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'MarkPro');
  static const headerText = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'MarkPro');
  static const buttonText = TextStyle(color: Consts.orangeColor, fontSize: 14, fontFamily: 'MarkPro');
  static const headerWhiteText = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'MarkPro', color: Colors.white);
  static const subtitleWhiteText = TextStyle(fontSize: 12,  fontFamily: 'MarkPro', color: Colors.white);
  static const buyText = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'MarkPro', color: Colors.black);
  static const filterWhiteText = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'MarkPro', color: Colors.white);
  static const filterBlackText = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'MarkPro', color: Colors.black);
  static const filterGreyText = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'MarkPro', color: Colors.grey);
  static const filterBlackThinText = TextStyle(fontSize: 18, fontFamily: 'MarkPro', color: Colors.black);
  static const smallGreyText = TextStyle(fontSize: 12, fontFamily: 'MarkPro', color: Colors.grey);
  static const middleGreyText = TextStyle(fontSize: 14, fontFamily: 'MarkPro', color: Colors.grey, fontWeight: FontWeight.bold,);
  static const middleWhiteText = TextStyle(fontSize: 14, fontFamily: 'MarkPro', color: Colors.white, fontWeight: FontWeight.bold,);
}