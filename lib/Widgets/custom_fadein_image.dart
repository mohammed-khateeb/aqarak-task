import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Utils/images.dart';

class CustomFadeInImage extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  const CustomFadeInImage({Key? key, this.image, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: height,
              width: width,
              color: Colors.white,
            ),
          ),
        ),
        FadeInImage.assetNetwork(
          placeholder: Images.placeholderImage,
          fit: BoxFit.cover,
          width:width,

          height: height,
          image: image??"",
          imageErrorBuilder: (c, o, s) =>
              Image.asset(
                  Images.errorImage,
                  width: 70,
                  height: 65,
                  fit: BoxFit.contain),
          // width: 100, height: 100, fit: BoxFit.cover,
        ),
      ],
    );
  }
}
