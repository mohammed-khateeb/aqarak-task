import 'package:aqarek_task/Utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: size.longestSide*0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS_DEFAULT),
              color: Colors.white
            ),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 3,
              padding: const EdgeInsets.only(
                  left: Dimensions.PADDING_SIZE_LARGE),
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      right: Dimensions.PADDING_SIZE_LARGE),
                  child: Container(
                    height: 200,
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
          Container(
            height: size.longestSide*0.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS_DEFAULT),
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}
