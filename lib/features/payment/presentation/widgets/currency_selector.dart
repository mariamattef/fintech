import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CurrencySelector extends StatelessWidget {
  final String code;
  final IconData icon;

  const CurrencySelector({super.key, required this.code, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
     
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: Theme.of(context).brightness == Brightness.dark?Color(0xff1E1E1E):Color(0xffEEEEEE),
            ),
            child: Icon(icon, size: 20.sp),
          ),
          Gap(8.w),
          Text(code, style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary)),
          Gap(8.w),
          const Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.grey),
        ],
      ),
    );
  }
}
