import 'package:flutter/material.dart';

class ProductDetailsScreenUpperPart extends StatelessWidget {
  const ProductDetailsScreenUpperPart({Key? key, required this.productDetailsPictures}) : super(key: key);
  final List<String> productDetailsPictures;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
      const VerticalDivider(
        width: 0,
        color: Colors.transparent,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: productDetailsPictures.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: widthScreen * 0.6,
          //height: widthScreen * 0.6,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 10.0,
              ),
            ],
            borderRadius: BorderRadius.circular(widthScreen * 0.02),
            image: DecorationImage(
              image: NetworkImage(productDetailsPictures[index]),
              fit: BoxFit.contain,
            ),
            //shape: BoxShape.circle,
          ),
        );
      },
      shrinkWrap: true,
      //padding: EdgeInsets.all(10),
      //scrollDirection: Axis.horizontal,
    );
  }
}
