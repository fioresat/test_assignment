import 'package:flutter/material.dart';
import 'package:test_assignment/additions/consts.dart';

import '../../additions/my_text_style.dart';

class PhoneCardCart extends StatefulWidget {
  const PhoneCardCart(
      {Key? key,
      required this.names,
      required this.prices,
      required this.pictures})
      : super(key: key);

  final String names;
  final double prices;
  final String pictures;

  @override
  State<PhoneCardCart> createState() => PhoneCardCartState();
}

class PhoneCardCartState extends State<PhoneCardCart> {
  int _amount = 1;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: widthScreen * 0.2,
            height: widthScreen * 0.2,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(widthScreen * 0.02),
              image: DecorationImage(
                image: NetworkImage(widget.pictures),
                fit: BoxFit.contain,
              ),
              //shape: BoxShape.circle,
            ),
          ),
          Container(
            width: widthScreen * 0.4,
            height: widthScreen * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.names, style: MyTextStyle.cartWhiteText),
                Text(
                    '\$${widget.prices
                    //   * _amount
                    }',
                    style: MyTextStyle.cartOrangeText),
              ],
            ),
          ),
          Container(
            width: widthScreen * 0.1,
            height: widthScreen * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _amount++;
                    });
                  },
                  child: Image.asset(
                    Consts.plusIcon,
                    color: Colors.white,
                    height: 20,
                    width: 20,
                  ),
                ),
                Text('$_amount', style: MyTextStyle.cartWhiteText),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (_amount > 1) {
                        _amount--;
                      }
                    });
                  },
                  child: Image.asset(
                    Consts.minusIcon,
                    color: Colors.white,
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: widthScreen * 0.1,
            height: widthScreen * 0.2,
            child: Image.asset(
              Consts.deleteIcon,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
