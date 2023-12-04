import 'package:aqarek_task/Utils/color_utils.dart';
import 'package:flutter/material.dart';

import '../../Model/api/partner.dart';
import '../../Utils/dimensions.dart';
import '../../Utils/images.dart';
import '../../Widgets/custom_fadein_image.dart';

class PartnersView extends StatelessWidget {
  final List<Partner> partners;
  const PartnersView({Key? key, required this.partners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: partners.length,
        padding: const EdgeInsets.only(
            left: Dimensions.PADDING_SIZE_LARGE),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
                right: Dimensions.PADDING_SIZE_LARGE),
            child: Container(
              width: 180,
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_SMALL
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: kBackgroundColor
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS_SMALL),
                    child: CustomFadeInImage(
                      image: partners[index].image,
                      width: 50,
                      height: 50,
                    )
                  ),
                  VerticalDivider(
                    color: kPrimaryColor,
                    indent: 25,
                    endIndent: 25,
                  ),
                  Expanded(
                    child: Text(
                      partners[index].title??"",
                      style: TextStyle(
                          fontSize: Dimensions.FONT_SIZE_LARGE
                      ),
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
