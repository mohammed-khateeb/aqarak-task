import 'package:aqarek_task/Utils/color_utils.dart';
import 'package:aqarek_task/Utils/dimensions.dart';
import 'package:aqarek_task/bottom_bar/notch_bottom_bar_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'animated_notch_bottom_bar.dart';
import 'bottom_bar_item_model.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  NotchBottomBarController notchBottomBarController =
      NotchBottomBarController(index: 3);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return 1 == 1
        ? CurvedNavigationBar(
            backgroundColor: Colors.white,
            color: kPrimaryColor,
            buttonBackgroundColor: kPrimaryColor,
            items: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.white,
                  ),
                  if(index!=0)
                  Text(
                    "الرئيسية",
                    style: TextStyle(color: Colors.white,fontSize: Dimensions.FONT_SIZE_SMALL),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                  if(index!=1)
                    const Text(
                      "البحث",
                      style: TextStyle(color: Colors.white,fontSize: Dimensions.FONT_SIZE_SMALL),
                    )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.map,
                    size: 30,
                    color: Colors.white,
                  ),
                  if(index!=2)
                    const Text(
                      "الخريطة",
                      style: TextStyle(color: Colors.white,fontSize: Dimensions.FONT_SIZE_SMALL),
                    )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.folder,
                    size: 30,
                    color: Colors.white,
                  ),
                  if(index!=3)
                    const Text(
                      "الملفات",
                      style: TextStyle(color: Colors.white,fontSize: Dimensions.FONT_SIZE_SMALL),
                    )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.white,
                  ),
                  if(index!=4)
                    const Text(
                      "اخرى",
                      style: TextStyle(color: Colors.white,fontSize: Dimensions.FONT_SIZE_SMALL),
                    )
                ],
              ),
            ],
            onTap: (index) {
             setState(() {
               this.index = index;
             });
            },
          )
        : AnimatedNotchBottomBar(
            notchBottomBarController: notchBottomBarController,
            removeMargins: true,
            color: kPrimaryColor,
            onTap: (int i) {},
            bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.folder,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.folder,
                    size: 50,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'ملفاتي',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.map,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.map,
                    size: 50,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'الخرائط',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.search,
                    size: 50,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'البحث',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.home,
                    size: 50,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'الرئيسية',
                ),
              ]);
  }
}
