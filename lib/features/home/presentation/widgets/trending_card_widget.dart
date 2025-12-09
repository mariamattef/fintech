import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TrendingCardWidget extends StatelessWidget {
  final String name, symbol, price, change, img;
  

  const TrendingCardWidget({
    super.key,
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.w,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const Spacer(),
              CachedNetworkImage(
                imageUrl: img,
                width: 30.w,
                height: 30.h,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ],
          ),
          Gap(4.h),
          Text(
            symbol,
            style: AppTextStyles.textst12.copyWith(
              color: Color.fromRGBO(120, 122, 141, 1),
            ),
          ),
          Gap(18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style:AppTextStyles.headingStyle20.copyWith(
                   color: Theme.of(context).colorScheme.primary,
                 ),
                
             
              ),
              Text(
                "$change ▴",
                style: AppTextStyles.textst12.copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Color(0xff6079FA)
                      : Color(0xff4766F9),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
