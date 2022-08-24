import 'package:flutter/material.dart';

import '../../additions/consts.dart';
import '../../additions/my_text_style.dart';

class Filter extends StatefulWidget {
  Filter({Key? key, required this.brands}) : super(key: key);

  final List<String> brands;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {


  @override
  Widget build(BuildContext context) {
    var itemsBrands = widget.brands;
    String dropdownBrand = itemsBrands[0];
    var itemsPrices = [
      '\$0 - \$300',
      '\$300 - \$500',
      '\$500 - \$1000',
      '\$1000 - \$10000'
    ];
    String dropdownPrices = itemsPrices[0];
    var itemsSizes = ['Small', 'Medium', 'Huge'];
    String dropdownSizes = itemsSizes[0];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Consts.blackColor,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Icon(Icons.close, color: Colors.white),
              ),
              Text('Filter Options', style: MyTextStyle.filterBlackText),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Consts.orangeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Done', style: MyTextStyle.filterWhiteText),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text('Brand', style: MyTextStyle.filterBlackText),
          _dropDownFilter(dropdownBrand, itemsBrands),
          SizedBox(
            height: 10,
          ),
          Text('Price', style: MyTextStyle.filterBlackText),
          _dropDownFilter(dropdownPrices, itemsPrices),
          SizedBox(
            height: 10,
          ),
          Text('Size', style: MyTextStyle.filterBlackText),
          _dropDownFilter(dropdownSizes, itemsSizes),
        ],
      ),
    );
  }

  Widget _dropDownFilter(String dropdownValue, List<String> items) {
    return DropdownButtonFormField<String>(
      value: dropdownValue,
      icon: Icon(Icons.keyboard_arrow_down_outlined),
      elevation: 8,
      style: MyTextStyle.filterBlackThinText,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
    );
  }
}
