import 'package:flutter/material.dart';

import '../../additions/consts.dart';
import '../../additions/my_text_style.dart';

class HotSales extends StatelessWidget {
  const HotSales(
      {Key? key,
      required this.hotSalesNames,
      required this.hotSalesPictures,
      required this.hotSalesSubtitle,
      required this.hotSalesIsBuy,
      required this.hotSalesIsNew})
      : super(key: key);

  final List<String> hotSalesNames;
  final List<String> hotSalesPictures;
  final List<String> hotSalesSubtitle;
  final List<bool> hotSalesIsBuy;
  final List<bool> hotSalesIsNew;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          const VerticalDivider(
        width: 0,
        color: Colors.transparent,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: hotSalesPictures.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: widthScreen * 0.95,
          //height: widthScreen * 0.6,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widthScreen * 0.02),
            image: DecorationImage(
              image: NetworkImage(hotSalesPictures[index]),
              fit: BoxFit.fill,
            ),
            //shape: BoxShape.circle,
          ),
          child: Container(
            width: widthScreen * 0.3,
            margin: EdgeInsets.only(left: 20, top: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (hotSalesIsNew[index])
                    ? Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Consts.orangeColor,
                          shape: BoxShape.circle,
                        ),
                        child: FittedBox(
                            child: Text(
                          'New',
                          style: MyTextStyle.subtitleWhiteText,
                        )))
                    : Container(
                        width: 30,
                        height: 30,
                      ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  hotSalesNames[index],
                  style: MyTextStyle.headerWhiteText,
                ),
                Text(
                  hotSalesSubtitle[index],
                  style: MyTextStyle.subtitleWhiteText,
                ),
                SizedBox(
                  height: 10,
                ),
                (hotSalesIsNew[index])
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/product_details_screen');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Buy now!',
                          style: MyTextStyle.buyText,
                        ),
                      )
                    : Container(
                        width: 30,
                        height: 30,
                      ),
              ],
            ),
          ),
        );
      },
      shrinkWrap: true,
      //padding: EdgeInsets.all(10),
      //scrollDirection: Axis.horizontal,
    );
  }
}
