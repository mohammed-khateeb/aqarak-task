import 'package:aqarek_task/Model/api/header_gallery.dart';
import 'package:aqarek_task/Utils/color_utils.dart';
import 'package:aqarek_task/Widgets/custom_fadein_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  final List<HeaderGallery> galleries;
  const HomeBanner({Key? key, required this.galleries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      height: size.longestSide * 0.5,
      child: Stack(
        children: [
          Swiper(
            outer: false,
            autoplay: true,
            viewportFraction: 1,
            itemBuilder: (BuildContext context, int index) {
              return CustomFadeInImage(
                image: galleries[index].image,
                width: size.width,
              );
            },
            pagination: SwiperPagination(builder: SwiperCustomPagination(
                builder: (BuildContext context, SwiperPluginConfig config) {
              return Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.006),
                child: SizedBox(
                    width: size.width,
                    height: size.height * 0.006,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: galleries.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: config.activeIndex == index
                                    ? BorderRadius.circular(size.height * 0.02)
                                    : null,
                                color: config.activeIndex == index
                                    ? Colors.white
                                    : Colors.grey[200],
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
            itemCount: galleries.length,
          ),
          Container(
            height: size.height*0.25,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0,0.8,1],
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0),

                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}
