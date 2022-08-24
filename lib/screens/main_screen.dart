import 'package:flutter/material.dart';
import 'package:test_assignment/screens/widgets/filter.dart';
import 'package:test_assignment/screens/widgets/hot_sales.dart';
import 'package:test_assignment/screens/widgets/main_screen_rows.dart';

import 'package:test_assignment/screens/widgets/phone_card.dart';
import 'package:test_assignment/screens/widgets/top_panel.dart';

import '../additions/consts.dart';
import '../additions/my_text_style.dart';
import '../data/service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _storeService = StoreService();
  List<String> _names = [];
  List<String> _pictures = [];
  List<double> _pricesFull = [];
  List<double> _pricesDiscount = [];
  List<bool> _isFavorite = [];
  int _selectedIndex = 0;
  List<String> _hotSalesNames = [];
  List<String> _hotSalesPictures = [];
  List<String> _hotSalesSubtitle = [];
  List<bool> _hotSalesIsBuy = [];
  List<bool> _hotSalesIsNew = [];
  List<String> _brands = [];

  @override
  void initState() {
    super.initState();
    _create();
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
        elevation: 0,
        actions: [
          IconButton(
            icon: Image.asset(Consts.filterIcon, color: Consts.blackColor),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Filter(
                      brands: _brands,
                    );
                  });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MainScreenRows(
              buttonText: 'view all',
              section: 'Select Category',
            ),
            SingleChildScrollView(
              child: Container(
                height: heightScreen * 0.1,
                child: TopPanel(
                  selectedIndex: _selectedIndex,
                ),
              ),
            ),
            const MainScreenRows(
              buttonText: 'see more',
              section: 'Hot Sales',
            ),
            SingleChildScrollView(
              child: Container(
                height: widthScreen * 0.4,
                child: HotSales(
                  hotSalesPictures: _hotSalesPictures,
                  hotSalesSubtitle: _hotSalesSubtitle,
                  hotSalesIsBuy: _hotSalesIsBuy,
                  hotSalesIsNew: _hotSalesIsNew,
                  hotSalesNames: _hotSalesNames,
                ),
              ),
            ),
            const MainScreenRows(
              buttonText: 'see more',
              section: 'Best Seller',
            ),
            SingleChildScrollView(
              child: Container(
                height: widthScreen * 4 / 3,
                child: _bestSeller,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _create() async {
    final dataDecoded = await _storeService.getStore();
    _bestSellerData(dataDecoded);
    _hotSalesData(dataDecoded);
  }

  Widget get _bestSeller => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0),
        itemCount: _pictures.length,
        itemBuilder: (_, i) => Card(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/product_details_screen');
            },
            child: PhoneCard(
                name: _names[i],
                image: _pictures[i],
                fullPrice: _pricesFull[i],
                discountPrice: _pricesDiscount[i],
                isFavorite: _isFavorite[i]),
          ),
        ),
      );

  void _bestSellerData(data) {
    setState(() {
      if (data != null) {
        _names = [];
        _pictures = [];
        _pricesFull = [];
        _pricesDiscount = [];
        _isFavorite = [];
        _brands = [];

        for (int i = 0; i < data['best_seller'].length; i++) {
          _pictures.add(data['best_seller'][i]['picture'].toString());
          _names.add(data['best_seller'][i]['title'].toString());
          _pricesDiscount
              .add(data['best_seller'][i]['price_without_discount'].toDouble());
          _pricesFull.add(data['best_seller'][i]['discount_price'].toDouble());
          _isFavorite.add(data['best_seller'][i]['is_favorites']);
          if (_brands.contains(_names[i].split(" ")[0]) == false) {
            _brands.add(_names[i].split(" ")[0]);
          }
        }
        print(_isFavorite);
      } else {
        print('\nsomething wrong in _updateData\n');
      }
    });
  }

  void _hotSalesData(data) {
    setState(() {
      if (data != null) {
        _hotSalesNames = [];
        _hotSalesPictures = [];
        _hotSalesSubtitle = [];
        _hotSalesIsBuy = [];
        _hotSalesIsNew = [];

        for (int i = 0; i < data['home_store'].length; i++) {
          _hotSalesPictures.add(data['home_store'][i]['picture'].toString());
          _hotSalesNames.add(data['home_store'][i]['title'].toString());
          _hotSalesSubtitle.add(data['home_store'][i]['subtitle'].toString());
          (data['home_store'][i]['is_buy'] != null)
              ? _hotSalesIsBuy.add(data['home_store'][i]['is_buy'])
              : _hotSalesIsBuy.add(false);
          (data['home_store'][i]['is_new'] != null)
              ? _hotSalesIsNew.add(data['home_store'][i]['is_new'])
              : _hotSalesIsNew.add(false);
        }
      } else {
        print('\nsomething wrong in _updateData\n');
      }
    });
  }
}
