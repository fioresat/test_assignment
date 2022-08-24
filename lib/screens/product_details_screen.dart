import 'package:flutter/material.dart';
import 'package:test_assignment/screens/widgets/phone_description_card.dart';
import 'package:test_assignment/screens/widgets/product_details_screen_upper_part.dart';

import '../additions/consts.dart';
import '../additions/my_text_style.dart';
import '../data/service.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final _storeService = StoreService();
  String _names = '';
  List<String> _pictures = [];
  String _cpu = '';
  String _camera = '';
  double _prices = 0;
  double _rating = 0;
  List<String> _capacity = [];
  List<String> _color = [];
  String _sd = '';
  String _ssd = '';
  bool _isFavorite = true;

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
        backgroundColor: Color(0x00000000),
        elevation: 0,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Consts.blackColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 40,
            height: 40,
            child: Image.asset(Consts.arrowBackIcon,
                color: Colors.white),
          ),
        ),
        title: Text('Product Details', style: MyTextStyle.filterBlackText),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart_screen');
            }, //ToDo
            child: Container(
              decoration: BoxDecoration(
                color: Consts.orangeColor,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 40,
              height: 40,
              child: Image.asset(Consts.cartIcon, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: heightScreen * 0.35,
                child: ProductDetailsScreenUpperPart(productDetailsPictures: _pictures,),
              ),
            ),
            PhoneDescriptionCard(
              cpu: _cpu,
              ssd: _ssd,
              phoneNames: _names,
              capacity: _capacity,
              phonePrices: _prices,
              sd: _sd,
              rating: _rating,
              isPhoneFavorite: _isFavorite,
              camera: _camera,
              color: _color,
            ),
          ],
        ),
      ),
    );
  }

  void _create() async {
    final dataDecoded1 = await _storeService.getPhone();
    _phonesData(dataDecoded1);
  }

  void _phonesData(data) {
    setState(() {
      if (data != null) {
        _names = '';
        _pictures = [];
        _prices = 0;
        _cpu = '';
        _camera = '';
        _rating = 0;
        _capacity = [];
        _color = [];
        _sd = '';
        _ssd = '';
        _isFavorite = true;

        for (int i = 0; i < data['images'].length * 5; i++) {
          _pictures.add(data['images'][i % 2].toString());
        }
        for (int j = 0; j < data['capacity'].length; j++) {
          _capacity.add(data['capacity'][j].toString());
        }

        for (int k = 0; k < data['color'].length; k++) {
          _color.add(data['color'][k].toString());
        }
        _names = (data['title'].toString());
        _prices = (data['price'].toDouble());
        _isFavorite = (data['isFavorites']);
        _cpu = (data['CPU'].toString());
        _camera = (data['camera'].toString());
        _rating = (data['rating'].toDouble());
        _sd = (data['sd'].toString());
        _ssd = (data['ssd'].toString());
      } else {
        print('\nsomething wrong in _updateData\n');
      }
    });
  }

 
}
