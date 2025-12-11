import 'package:cached_network_image/cached_network_image.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/features/market/presentation/screens/coin_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CryptoListItem extends StatelessWidget {
  final String name;
  final String symbol;
  final int rank;
  final String price;
  final double change;
  final String image;
  final String id; 

  const CryptoListItem({
    super.key,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.price,
    required this.change,
    required this.image,
    required this.id, 
  });

  @override
  Widget build(BuildContext context) {
    final bool isPositive = change >= 0;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CoinDetailsScreen.routeName, arguments: id);
      },
      child: Card(
        child: Container(
          margin: EdgeInsets.all(5.0.h),
          padding: EdgeInsets.all(10.0.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Color.fromRGBO(21, 21, 21, 1)
                      : Color.fromRGBO(247, 247, 247, 1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: CachedNetworkImage(
                  imageUrl: image,
                  width: 28.w,
                  height: 28.h,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Gap(15.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Color(0xffE1F8D3)
                            : Color(0xff152C07),
                      ),
                    ),
                    Gap(4),
                    Text(
                      "Rank #$rank",
                      style: TextStyle(
                        color: Color.fromRGBO(93, 92, 93, 1),
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$$price",
                    style: AppTextStyles.headingStyle16.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Color(0xffE1F8D3)
                          : Color(0xff152C07),
                    ),
                  ),
                  Gap(4.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.h,
                      vertical: 4.w,
                    ),
                    decoration: BoxDecoration(
                      color: isPositive
                          ? Color.fromRGBO(0, 229, 118, 0.8)
                          : Color.fromRGBO(244, 126, 126, 0.8),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        isPositive
                            ? SvgPicture.asset(
                                'assets/svg/icons/arrow-up-right.svg',
                                height: 15.h,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.surface,
                                  BlendMode.srcIn,
                                ),
                              )
                            : SvgPicture.asset(
                                'assets/svg/icons/arrow-down-right.svg',
                                height: 15.h,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.surface,
                                  BlendMode.srcIn,
                                ),
                              ),
                        Gap(3.w),
                        Text(
                          "${isPositive ? '+' : ''}${change.toStringAsFixed(2)}%",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
