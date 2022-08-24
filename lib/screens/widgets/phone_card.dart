import 'package:flutter/material.dart';

import '../../additions/my_text_style.dart';

class PhoneCard extends StatelessWidget {
  final String name;
  final String image;
  final double fullPrice;
  final double discountPrice;
  final bool isFavorite;

  const PhoneCard({
    Key? key,
    required this.name,
    required this.image,
    required this.fullPrice,
    required this.discountPrice,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: widthScreen * 0.4,
          height: widthScreen * 0.4 * 4 / 3,
          margin: EdgeInsets.all(widthScreen * 0.05),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(widthScreen * 0.02),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: widthScreen * 0.4,
                height: widthScreen * 0.4 * 4 / 4,
                padding: EdgeInsets.only(bottom: 10, top: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.fill,
                  ),
                  //shape: BoxShape.circle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$${discountPrice.toInt().toString()}',
                    style: MyTextStyle.discountPrice,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '\$${fullPrice.toInt().toString()}',
                    style: MyTextStyle.fullPrice,
                  ),
                ],
              ),
              FittedBox(
                child: Text(
                  name,
                  style: MyTextStyle.nameText,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: widthScreen * 0.4,
          height: widthScreen * 0.4 * 4 / 3,
          margin: EdgeInsets.all(widthScreen * 0.05),
          padding: EdgeInsets.only(
              bottom: widthScreen * 0.45, left: widthScreen * 0.3),
          child: isFavorite
              ? Icon(Icons.favorite, color: Colors.red)
              : Icon(Icons.favorite_border, color: Colors.red),
        ),
      ],
    );
  }
}
