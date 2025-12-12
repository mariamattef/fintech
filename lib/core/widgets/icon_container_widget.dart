import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconContainerWidget extends StatelessWidget {
  const IconContainerWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Color.fromRGBO(21, 21, 21, 1)
            : Color.fromRGBO(237, 240, 244, 1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: CachedNetworkImage(
        imageUrl: image,
        width: 28.w,
        height: 28.h,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
