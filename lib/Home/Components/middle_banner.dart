import 'package:aqarek_task/Utils/color_utils.dart';
import 'package:aqarek_task/Utils/dimensions.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../Model/api/header_offer.dart';
import '../../Utils/images.dart';
import '../../Widgets/custom_fadein_image.dart';

class MiddleBanner extends StatelessWidget {
  final List<HeaderOffers> headerOffers;
  const MiddleBanner({Key? key, required this.headerOffers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.longestSide * 0.25,
      child: Swiper(
        outer: true,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS_DEFAULT),

                      child: CustomFadeInImage(
                        image: headerOffers[index].image,
                        height: size.longestSide * 0.25,
                        width: size.width,
                      )),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS_SMALL),
                      ),
                      child: Image.asset(
                        Images.arrowLeft,
                        height: Dimensions.ICON_SIZE_DEFAULT,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_LARGE,right: Dimensions.PADDING_SIZE_DEFAULT),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: size.width*0.25,
                        child: Text(
                          headerOffers[index].title??"",
                          style: TextStyle(
                            fontSize: size.height*0.037,
                            color: Colors.white
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        pagination: SwiperPagination(builder: SwiperCustomPagination(
            builder: (BuildContext context, SwiperPluginConfig config) {
          return Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.006),
            child: SizedBox(
                height: size.height * 0.006,
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: headerOffers.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: config.activeIndex == index
                                ? BorderRadius.circular(size.height * 0.02)
                                : null,
                            color: config.activeIndex == index
                                ? kPrimaryColor
                                : kPrimaryColor.withOpacity(0.4),
                            shape: config.activeIndex != index
                                ? BoxShape.circle
                                : BoxShape.rectangle,
                          ),
                          width: config.activeIndex == index
                              ? size.height * 0.015
                              : size.height * 0.01,
                        ),
                      );
                    },
                  ),
                )),
          );
        })),
        itemCount: headerOffers.length,
      ),
    );
  }
}
