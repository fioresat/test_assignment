import 'package:flutter/material.dart';
import 'package:test_assignment/additions/my_text_style.dart';
import 'package:test_assignment/screens/widgets/cart_screen_bottom_part.dart';
import 'package:test_assignment/screens/widgets/phone_cart_card.dart';

import '../additions/consts.dart';
import '../data/service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _storeService = StoreService();
  List<String> _names = [];
  List<String> _pictures = [];
  List<double> _prices = [];
  double _total = 0;
  String _delivery = '';

  @override
  void initState() {
    super.initState();
    _create();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x00000000),
        elevation: 0,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          }, //ToDo
          child: Container(
            decoration: BoxDecoration(
              color: Consts.blackColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 40,
            height: 40,
            child: Image.asset(Consts.arrowBackIcon, color: Colors.white),
          ),
        ),
        actions: [
          Row(
            children: [
              const Text(
                'Add adress',
                style: MyTextStyle.filterBlackText,
                textAlign: TextAlign.end,
              ),
              TextButton(
                onPressed: () {}, //ToDo
                child: Container(
                  decoration: BoxDecoration(
                    color: Consts.orangeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 40,
                  height: 40,
                  child: Image.asset(Consts.locationIcon, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30, top: 40, bottom: 40),
              height: heightScreen * 0.14,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('My Cart', style: MyTextStyle.myCartText),
                ],
              ),
            ),
            CartScreenBottomPart(
              namesCartScreen: _names,
              picturesCartScreen: _pictures,
              pricesCartScreen: _prices,
              delivery: _delivery,
              total: _total,
            ),
          ],
        ),
      ),
    );
  }

  void _create() async {
    final dataDecoded2 = await _storeService.getCart();
    _cartData(dataDecoded2);
  }

  void _cartData(data) {
    setState(() {
      if (data != null) {
        _names = [];
        _pictures = [];
        _prices = [];
        _total = 0;
        _delivery = '';

        for (int i = 0; i < data['basket'].length; i++) {
          _names.add(data['basket'][i]['title'].toString());
          _pictures.add(data['basket'][i]['images'].toString());
          _prices.add(data['basket'][i]['price'].toDouble());
        }
        _total = (data['total'].toDouble());
        _delivery = (data['delivery'].toString());
      } else {
        print('\nsomething wrong in _updateData\n');
      }
    });
  }
}
