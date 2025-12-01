import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextFieldMarket extends StatelessWidget {
  const TextFieldMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0.r)),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: AppTextStyles.lRegular.copyWith(
            fontSize: 16.sp,
            color: Color(0xff8F8F8F),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: 12.0.r,
              right: 12.0.r,
              // bottom: 12.r,
              // top: 1.r,
            ),
            child: SvgPicture.asset('assets/svg/icons/search-normal.svg'),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.all(12.0.r),
            child: SvgPicture.asset('assets/svg/icons/setting-5.svg'),
          ),
          filled: true,
          fillColor: Colors.white,

          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    
    );
  }
}
