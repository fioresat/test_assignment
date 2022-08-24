import 'package:flutter/material.dart';
import 'package:test_assignment/screens/widgets/phone_cart_card.dart';

import '../../additions/consts.dart';
import '../../additions/my_text_style.dart';

class CartScreenBottomPart extends StatefulWidget {
  const CartScreenBottomPart(
      {Key? key,
      required this.namesCartScreen,
      required this.picturesCartScreen,
      required this.pricesCartScreen,
      required this.total,
      required this.delivery})
      : super(key: key);

  final List<String> namesCartScreen;
  final List<String> picturesCartScreen;
  final List<double> pricesCartScreen;
  final double total;
  final String delivery;

  @override
  State<CartScreenBottomPart> createState() => _CartScreenBottomPartState();
}

class _CartScreenBottomPartState extends State<CartScreenBottomPart> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Consts.blackColor,
        borderRadius: BorderRadius.circular(widthScreen * 0.04),
      ),
      height: heightScreen * 0.8,
      child: Column(
        children: [
          Container(
            height: heightScreen * 0.35,
            child: ListView(children: [
              for (int i = 0; i < widget.picturesCartScreen.length; i++)
                PhoneCardCart(
                  pictures: widget.picturesCartScreen[i],
                  names: widget.namesCartScreen[i],
                  prices: widget.pricesCartScreen[i],
                ),
            ]),
          ),
          SizedBox(
            height: heightScreen * 0.2,
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.white24),
                top: BorderSide(width: 1.0, color: Colors.white24),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Total', style: MyTextStyle.smallWhiteText),
                    Text('Delivery', style: MyTextStyle.smallWhiteText),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$${widget.total} us', style: MyTextStyle.smallBoldWhiteText),
                    Text(widget.delivery, style: MyTextStyle.smallBoldWhiteText),
                  ],
                ),
              ],
            ),
          ),
          _checkout(),
        ],
      ),
    );
  }

  Widget _checkout() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Consts.orangeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Checkout', style: MyTextStyle.headerWhiteText),
          ],
        ),
      ),
    );
  }
}
