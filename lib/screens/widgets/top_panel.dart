import 'package:flutter/material.dart';

import '../../additions/consts.dart';

class TopPanel extends StatefulWidget {
  const TopPanel({Key? key, required this.selectedIndex})
      : super(key: key);

  final int selectedIndex;

  @override
  State<TopPanel> createState() => _TopPanelState();
}

class _TopPanelState extends State<TopPanel> {
int selectedIndex = 0;

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
      itemCount: Consts.categoriesText.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            setState(() {
              // устанавливаем индекс выделенного элемента
              selectedIndex = index;
            });
          },
          child: SizedBox(
            width: 100,
            height: 100,
            child: Column(children: [
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: (selectedIndex == index)
                        ? Consts.orangeColor
                        : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Consts.categoriesIcon[index],
                      color: (selectedIndex == index)
                          ? Colors.white
                          : Colors.grey)),
              SizedBox(
                height: 10,
              ),
              Text(
                Consts.categoriesText[index],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: (selectedIndex == index)
                      ? Consts.orangeColor
                      : Consts.blackColor,
                ),
              ),
            ]),
          ),
        );
      },
      shrinkWrap: true,
      //padding: EdgeInsets.all(10),
      //scrollDirection: Axis.horizontal,
    );
  }
}
