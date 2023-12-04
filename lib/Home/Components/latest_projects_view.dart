import 'package:aqarek_task/Model/api/latest_project.dart';
import 'package:aqarek_task/Utils/color_utils.dart';
import 'package:aqarek_task/Widgets/custom_fadein_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/dimensions.dart';
import '../../Utils/images.dart';

class LatestProjectsView extends StatelessWidget {
  final List<ProjectItems> latestProjects;
  const LatestProjectsView({Key? key, required this.latestProjects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: latestProjects.length,
        padding: const EdgeInsets.only(
            left: Dimensions.PADDING_SIZE_LARGE),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
                right: Dimensions.PADDING_SIZE_LARGE),
            child: Container(
              width: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS_DEFAULT),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimensions.BORDER_RADIUS_DEFAULT)),
                    child: CustomFadeInImage(
                      image: latestProjects[index].image,
                      height: 220,
                      width: 220,
                    )
                  ),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(Dimensions.BORDER_RADIUS_DEFAULT)),

                          border: Border.all(
                            color: Colors.grey
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.network(
                                latestProjects[index].icon??"",
                                height: Dimensions.ICON_SIZE_LARGE,
                                width: Dimensions.ICON_SIZE_LARGE,
                              ),
                              SizedBox(width: Dimensions.PADDING_SIZE_SMALL,),
                              Expanded(
                                child: Text(
                                  latestProjects[index].title??"",
                                  style: TextStyle(

                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            latestProjects[index].cityname??"",
                            style: TextStyle(

                            ),
                          ),
                        ],
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
