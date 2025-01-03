import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final dynamic imageSource; // Accepts File, Uint8List, or String (URL)
  final double imageHeight;
  final double imageWidth;
  final bool isCircularImage;
  final BoxFit fit;
  final Color? backgroundColor; // Background color, nullable

  const ImageView({
    super.key,
    required this.imageSource,
    this.imageHeight = 200,
    this.imageWidth = 200,
    this.isCircularImage = false,
    this.fit = BoxFit.cover,
    this.backgroundColor, // Allow null or custom color
  });

  @override
  Widget build(BuildContext context) {
    if (imageSource is File) {
      // File image
      return _buildImageContainer(
        Image.file(
          imageSource as File,
          fit: fit,
          height: imageHeight,
          width: imageWidth,
        ),
      );
    } else if (imageSource is Uint8List) {
      // Memory image
      return _buildImageContainer(
        Image.memory(
          imageSource as Uint8List,
          fit: fit,
          height: imageHeight,
          width: imageWidth,
        ),
      );
    } else if (imageSource is String) {
      // Network image with CachedNetworkImage
      return CachedNetworkImage(
        imageUrl: imageSource as String,
        fit: fit,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: imageHeight,
            width: imageWidth,
            decoration: BoxDecoration(
              color: backgroundColor,
              image: DecorationImage(
                fit: fit,
                image: imageProvider,
              ),
              shape: isCircularImage ? BoxShape.circle : BoxShape.rectangle,
            ),
          );
        },
        placeholder: (context, url) => _buildPlaceholder(),
        errorWidget: (context, url, error) => _buildErrorIcon(),
      );
    } else {
      // Placeholder for unsupported sources
      return _buildPlaceholder();
    }
  }

  Widget _buildImageContainer(Widget image) {
    return Container(
      height: imageHeight,
      width: imageWidth,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: isCircularImage ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: ClipRRect(
        borderRadius: isCircularImage
            ? BorderRadius.circular(imageWidth / 2)
            : BorderRadius.zero,
        child: image,
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      height: imageHeight,
      width: imageWidth,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey[300],
        shape: isCircularImage ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  Widget _buildErrorIcon() {
    return Container(
      height: imageHeight,
      width: imageWidth,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey[300],
        shape: isCircularImage ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: const Center(
        child: Icon(Icons.error),
      ),
    );
  }
}
