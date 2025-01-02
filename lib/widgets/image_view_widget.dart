import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetworkImageView extends StatelessWidget {
  final String url;
  final double imageHight;
  final double imageWidth;
  final bool isCircularImage;
  final BoxFit fit;

  const NetworkImageView(
      {super.key,
      required this.url,
      this.imageHight = 200,
      this.imageWidth = 200,
      this.isCircularImage = false,
      this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: imageHight,
          width: imageWidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: fit,
                image: imageProvider,
              ),
              shape: isCircularImage ? BoxShape.circle : BoxShape.rectangle),
        );
      },
      placeholder: (context, url) => Container(
          height: imageHight,
          width: imageWidth,
          decoration: BoxDecoration(
              shape: isCircularImage ? BoxShape.circle : BoxShape.rectangle),
          child: const Center(
            child: CupertinoActivityIndicator(),
          )),
      errorWidget: (context, url, error) => Container(
          height: imageHight,
          width: imageWidth,
          decoration: BoxDecoration(
              shape: isCircularImage ? BoxShape.circle : BoxShape.rectangle),
          child: const Center(child: Icon(Icons.error))),
    );
  }
}
