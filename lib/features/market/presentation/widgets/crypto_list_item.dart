import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/features/market/presentation/screens/coin_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CryptoListItem extends StatelessWidget {
  final String name;
  final String symbol;
  final int rank;
  final String price;
  final String change;
  final bool isPositive;
  final IconData icon;
  final Color iconColor;
  const CryptoListItem({
    super.key,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.price,
    required this.change,
    required this.isPositive,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CoinDetailsScreen.routeName);
      },
      child: Card(
        child: Container(
          margin: EdgeInsets.only(bottom: 10.0.h),
          padding: EdgeInsets.all(10.0.r),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Color.fromRGBO(21, 21, 21, 1)
                      : Color.fromRGBO(247, 247, 247, 1),

                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(icon, color: iconColor, size: 28.sp),
              ),
              Gap(15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$$price",
                    style: AppTextStyles.headingStyle16.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Color(0xffE1F8D3)
                          : Color(0xff152C07),
                    ),
                  ),
                  Gap(4),
                  Container(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 8.h,
                      vertical: 4.w,
                    ),
                    decoration: BoxDecoration(
                      color: isPositive
                          ? Color.fromRGBO(0, 229, 118, 0.8)
                          : Color.fromRGBO(0244, 126, 126, 0.8),

                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      "${isPositive ? '+' : ''}$change",
                      style: TextStyle(
                        // color: isPositive
                        //     ? Color.fromRGBO(0, 229, 118, 0.8)
                        //     : Colors.red.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
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
