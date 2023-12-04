import 'package:aqarek_task/Model/api/unit.dart';
import 'package:aqarek_task/Utils/color_utils.dart';
import 'package:aqarek_task/Widgets/custom_fadein_image.dart';
import 'package:flutter/material.dart';

import '../../Utils/dimensions.dart';
import '../../Utils/images.dart';

class UnitsView extends StatelessWidget {
  final List<UnitItems> units;
  const UnitsView({Key? key, required this.units}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: units.length,
        padding: const EdgeInsets.only(
            left: Dimensions.PADDING_SIZE_LARGE),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
                right: Dimensions.PADDING_SIZE_LARGE),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS_DEFAULT),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimensions.BORDER_RADIUS_DEFAULT)),
                      child: CustomFadeInImage(
                        image: units[index].photourl,
                        width: 300,
                        height: 190,
                      )
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(Dimensions.BORDER_RADIUS_DEFAULT)),

                        border: Border.all(
                          color: Colors.grey
                      )
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: Dimensions.ICON_SIZE_LARGE,
                                    width: Dimensions.ICON_SIZE_LARGE,
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL,),
                                  Expanded(
                                    child: Text(
                                      units[index].title??"",
                                      style: TextStyle(

                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                units[index].text??"",
                                style: TextStyle(

                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                            units[index].pricetext??"",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: Dimensions.FONT_SIZE_VERY_SMALL
                          ),
                        ),
                      ],
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
