import 'package:aqarek_task/Model/api/header_widget.dart';
import 'package:aqarek_task/Utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/dimensions.dart';
import '../../Utils/images.dart';

class CategoriesView extends StatelessWidget {
  final List<HeaderWidgets> headerWidgets;
  const CategoriesView({Key? key, required this.headerWidgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: headerWidgets.length,
        padding: const EdgeInsets.only(
            left: Dimensions.PADDING_SIZE_LARGE),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
                right: Dimensions.PADDING_SIZE_LARGE),
            child: Container(
              height: 200,
              width: 160,
              padding: const EdgeInsets.symmetric(
                horizontal: 35
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: kBackgroundColor
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: SvgPicture.network(
                      headerWidgets[index].iconurl!,
                      fit: BoxFit.fill,
                      height: 90,
                    ),
                  ),
                  const SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
                  Text(
                    headerWidgets[index].title??"",
                    style: TextStyle(
                        fontSize: Dimensions.FONT_SIZE_LARGE
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
