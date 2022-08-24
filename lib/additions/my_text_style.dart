import 'package:flutter/material.dart';

import 'consts.dart';

class MyTextStyle {
  static const discountPrice = TextStyle(
      fontSize: 20, fontFamily: 'MarkPro', fontWeight: FontWeight.bold);
  static const fullPrice = TextStyle(
      fontSize: 12,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.normal,
      color: Color(0xff999Da0),
      decoration: TextDecoration.lineThrough);
  static const nameText = TextStyle(
    fontSize: 14,
    fontFamily: 'MarkPro',
    fontWeight: FontWeight.bold,
      color: Consts.blackColor
  );
  static const headerText = TextStyle(
    fontSize: 24,
    fontFamily: 'MarkPro',
    fontWeight: FontWeight.bold,
      color: Consts.blackColor
  );
  static const buttonText = TextStyle(
    fontSize: 14,
    fontFamily: 'MarkPro',
    color: Consts.orangeColor,
  );
  static const headerWhiteText = TextStyle(
      fontSize: 24,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.bold,
      color: Colors.white);
  static const subtitleWhiteText =
      TextStyle(fontSize: 12, fontFamily: 'MarkPro', color: Colors.white);
  static const buyText = TextStyle(
      fontSize: 14,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.bold,
      color: Consts.blackColor);
  static const filterWhiteText = TextStyle(
      fontSize: 18,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.bold,
      color: Colors.white);
  static const filterBlackText = TextStyle(
      fontSize: 18,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.bold,
      color: Consts.blackColor);
  static const filterGreyText = TextStyle(
      fontSize: 18,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.bold,
      color: Colors.grey);
  static const filterBlackThinText =
      TextStyle(fontSize: 18, fontFamily: 'MarkPro', color: Consts.blackColor);
  static const smallGreyText =
      TextStyle(fontSize: 12, fontFamily: 'MarkPro', color: Colors.grey);
  static const middleGreyText = TextStyle(
    fontSize: 14,
    fontFamily: 'MarkPro',
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );
  static const middleWhiteText = TextStyle(
    fontSize: 14,
    fontFamily: 'MarkPro',
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const cartWhiteText = TextStyle(
    fontSize: 18,
    fontFamily: 'MarkPro',
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const cartOrangeText = TextStyle(
    fontSize: 18,
    fontFamily: 'MarkPro',
    color: Color(0xFFFF6E4E),
    fontWeight: FontWeight.bold,
  );
  static const smallWhiteText =
      TextStyle(fontSize: 14, fontFamily: 'MarkPro', color: Colors.white);
  static const smallBoldWhiteText = TextStyle(
    fontSize: 14,
    fontFamily: 'MarkPro',
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const myCartText = TextStyle(
    fontSize: 26,
    fontFamily: 'MarkPro',
    color: Consts.blackColor,
    fontWeight: FontWeight.bold,
  );
}
