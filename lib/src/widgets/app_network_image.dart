import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;

  AppNetworkImage({required this.imageUrl, this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit ?? BoxFit.cover,
      progressIndicatorBuilder: (context, url, progress) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    context.theme.primary),
                value: progress.totalSize != null
                    ? progress.downloaded /
                    progress.totalSize!
                    : null),
          ),
        );
      },
    );
  }

}