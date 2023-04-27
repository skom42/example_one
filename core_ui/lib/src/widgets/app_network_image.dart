import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

import '../../core_ui.dart';

class AppNetworkImage extends StatelessWidget {
  final double height;
  final double width;
  final String? imageURL;
  final TextStyle? textStyle;
  final double? borderRadius;
  final BoxFit? fit;

  const AppNetworkImage({
    this.imageURL,
    this.textStyle,
    this.height = 158,
    this.width = 158,
    this.borderRadius,
    this.fit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(90),
      child: CachedNetworkImage(
        memCacheWidth: height.toInt(),
        memCacheHeight: width.toInt(),
        imageUrl: imageURL ?? GlobalConstants.accountAvatarPlaceholder,
        placeholder: (BuildContext context, String url) => Container(
          height: height,
          width: height,
          color: AppTheme.backgroundPrimaryColor,
          child: const CupertinoActivityIndicator(),
        ),
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
      ),
    );
  }
}
