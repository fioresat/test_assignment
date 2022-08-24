import 'dart:ui';

import 'package:flutter/material.dart';

abstract class Consts {
  static const baseUrl =
      'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175';
  static const phoneUrl =
      'https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5';
  static const basketUrl =
      'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149';
  static const getPhonesRequest = 'search'; //Request
  static const phonesLimit = 4;
  static const Color orangeColor = Color(0xFFFF6E4E);
  static const Color blackColor = Color(0xFF010035);
  static const List<String> categoriesText = [
    'Phones',
    'Computer',
    'Health',
    'Books',
    'Tablets'
  ];
  static const List<IconData> categoriesIcon = [
    Icons.phone_android_sharp,
    Icons.computer_sharp,
    Icons.heart_broken_outlined,
    Icons.book_online_sharp,
    Icons.tablet_mac_sharp
  ];
}
