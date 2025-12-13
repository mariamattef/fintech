import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconContainerWidget extends StatelessWidget {
  const IconContainerWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromRGBO(21, 21, 21, 1)
            : const Color.fromRGBO(237, 240, 244, 1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: image.toLowerCase().endsWith('.svg')
          ? SvgPicture.network(
              image,
              width: 28.w,
              height: 28.h,
              placeholderBuilder: (context) => const CircularProgressIndicator(),
            )
          : CachedNetworkImage(
              imageUrl: image,
              width: 28.w,
              height: 28.h,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
    );
  }
}
