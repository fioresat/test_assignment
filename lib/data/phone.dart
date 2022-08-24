import 'package:flutter/material.dart';

class Phone {
  Phone(
      {required this.name,
      required this.image,
      required this.fullPrice,
      required this.discountPrice,
      required this.isFavorite});

  final String name;
  final String image;
  final double fullPrice;
  final double discountPrice;
  final bool isFavorite;
}

