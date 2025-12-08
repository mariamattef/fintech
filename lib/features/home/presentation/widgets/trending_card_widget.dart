import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class TrendingCardWidget extends StatelessWidget {
  final String name, symbol, price, change;
  final String img;

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
                Image.network(
                  img,
                  width: 20,
                  height: 20,
                  // placeholderBuilder: (BuildContext context) => const SizedBox.shrink(),
                ),
            ],
          ),
          Gap(4.h),
          Text(
            symbol,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Gap(18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                "$change ▴",
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Color(0xff6079FA)
                      : Color(0xff4766F9),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
