import 'package:aqarek_task/Utils/color_utils.dart';
import 'package:aqarek_task/Utils/dimensions.dart';
import 'package:aqarek_task/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleWidget extends StatelessWidget {
  final String? title;
  const TitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return title!=null?Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.PADDING_SIZE_EXTRA_LARGE,
          right: Dimensions.PADDING_SIZE_EXTRA_LARGE,
          top: Dimensions.PADDING_SIZE_EXTRA_LARGE,

          bottom: Dimensions.PADDING_SIZE_SMALL
      ),
      child: Row(
        children: [
          Text(
            title!,
            style: TextStyle(
              fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width*0.1,),
          SvgPicture.asset(
            Images.arrowDown,
            height: 50,
            width: 50,
            fit: BoxFit.contain,

          ),

        ],
      ),
    ):SizedBox();
  }
}
