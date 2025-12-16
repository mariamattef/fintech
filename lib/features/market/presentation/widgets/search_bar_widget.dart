import 'package:easy_localization/easy_localization.dart';
import 'package:fintech/core/config/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchBartWidget extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const SearchBartWidget({
    super.key,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(10.0.r),
            child: SvgPicture.asset(
              AppAssets.searchNormal,
              colorFilter: ColorFilter.mode(
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
          ),
          hintText: "Search".tr(),
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: IconButton(
            padding: EdgeInsets.all(10.0.r),
            icon: SvgPicture.asset(
              AppAssets.setting5,
              colorFilter: ColorFilter.mode(
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
