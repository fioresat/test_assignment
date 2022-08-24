import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../additions/consts.dart';
import '../../additions/my_text_style.dart';

class PhoneDescriptionCard extends StatefulWidget {
  const PhoneDescriptionCard(
      {Key? key,
      required this.phoneNames,
      required this.cpu,
      required this.camera,
      required this.phonePrices,
      required this.rating,
      required this.capacity,
      required this.color,
      required this.sd,
      required this.ssd,
      required this.isPhoneFavorite})
      : super(key: key);

  final String phoneNames;
  final String cpu;
  final String camera;
  final double phonePrices;
  final double rating;
  final List<String> capacity;
  final List<String> color;
  final String sd;
  final String ssd;
  final bool isPhoneFavorite;

  @override
  State<PhoneDescriptionCard> createState() => _PhoneDescriptionCardState();
}

class _PhoneDescriptionCardState extends State<PhoneDescriptionCard> {
  int _selectedIndex = 0;
  int _selectedColor = 0;
  int _selectedCapacity = 0;
  List<String> _detailsText = [];

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    _detailsText = [widget.cpu,  widget.camera, widget.ssd, widget.sd];
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8.0,
          ),
        ],
      ),
      height: heightScreen * 0.55,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child:
                        Text(widget.phoneNames, style: MyTextStyle.headerText),
                  ),
                  TextButton(
                    onPressed: () {}, //ToDo
                    child: Container(
                      decoration: BoxDecoration(
                        color: Consts.blackColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 40,
                      height: 40,
                      child: widget.isPhoneFavorite
                          ? Icon(Icons.favorite, color: Colors.red)
                          : Icon(Icons.favorite_border, color: Colors.grey),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: RatingBar.builder(
                      initialRating: widget.rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      ignoreGestures: true,
                      itemCount: 5,
                      itemSize: 25.0,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _section(0, 'Shop', widthScreen),
              _section(1, 'Details', widthScreen),
              _section(2, 'Features', widthScreen)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for(int i=0; i<_detailsText.length; i++)
              _details(Consts.detailsIcon[i], _detailsText[i], widthScreen),

            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Select color and capacity',
                  style: MyTextStyle.filterBlackText),
            )
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < widget.color.length; i++)
                _color(i, widget.color[i], widthScreen),
              SizedBox(
                width: widthScreen * 0.1,
              ),
              for (int j = 0; j < widget.capacity.length; j++)
              _capacity(j, widget.capacity[j], widthScreen),
            ],
          ),
          _addToCart(widget.phonePrices),
        ],
      ),
    );
  }

  Widget _section(int index, String text, double widthScreen) {
    return InkWell(
      onTap: () {
        setState(() {
          // устанавливаем индекс выделенного элемента
          _selectedIndex = index;
        });
      },
      child: Container(
          alignment: Alignment.center,
          width: widthScreen * 0.25,
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            border: Border(
              bottom: (_selectedIndex == index)
                  ? BorderSide(width: 3.0, color: Consts.orangeColor)
                  : BorderSide(width: 0, color: Colors.transparent),
            ),
          ),
          child: Text(
            text,
            style: (_selectedIndex == index)
                ? MyTextStyle.filterBlackText
                : MyTextStyle.filterGreyText,
          )),
    );
  }

  Widget _details(String image, String text, double widthScreen) {
    return Container(
      width: widthScreen * 0.2,
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 30,
            height: 30,
            child: Image.asset(image, color: Colors.grey),
          ),
          Text(text, style: MyTextStyle.smallGreyText),
        ],
      ),
    );
  }

  Widget _color(int index, String color, double widthScreen) {
    int color1 = int.parse(color.replaceFirst('#', '0xFF'));
    print(color1);
    return InkWell(
      onTap: () {
        setState(() {
          // устанавливаем индекс выделенного элемента
          _selectedColor = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: widthScreen * 0.1,
        height: widthScreen * 0.1,
        //margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(color1),
        ),
        child: Icon(Icons.check,
            color:
                (_selectedColor == index) ? Colors.white : Colors.transparent),
      ),
    );
  }

  Widget _capacity(int index, String capacity, double widthScreen) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedCapacity = index;
        });
      },
      style: ElevatedButton.styleFrom(
        primary:
            (_selectedCapacity == index) ? Consts.orangeColor : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text('$capacity GB',
          style: (_selectedCapacity == index)
              ? MyTextStyle.middleWhiteText
              : MyTextStyle.middleGreyText),
    );
  }

  Widget _addToCart(double price) {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Add to Cart', style: MyTextStyle.headerWhiteText),
            Text('\$$price', style: MyTextStyle.headerWhiteText),
          ],
        ),
      ),
    );
  }
}
