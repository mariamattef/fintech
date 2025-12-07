import 'package:fintech/core/config/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchBartWidget extends StatelessWidget {
  const SearchBartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextField(
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
          hintText: "Search",
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

        // decoration: InputDecoration(
        //   filled: true,
        //   fillColor: Colors.white,
        //   prefixIcon: Padding(
        //     padding: EdgeInsets.all(10.0.r),
        //     child: SvgPicture.asset('assets/svg/icons/search-normal.svg'),
        //   ),
        //   hintText: "Search",
        //   hintStyle: const TextStyle(color: Colors.grey),
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(12.0.r),
        //     borderSide: const BorderSide(color: Colors.transparent, width: 0),
        //   ),
        //   enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(12.0.r),
        //     borderSide: const BorderSide(color: Colors.transparent, width: 0),
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(12.0.r),
        //     borderSide: const BorderSide(color: Colors.transparent, width: 0),
        //   ),
        //   suffixIcon: IconButton(
        //     padding: EdgeInsets.all(10.0.r),
        //     icon: SvgPicture.asset('assets/svg/icons/setting-5.svg'),
        //     onPressed: () {},
        //   ),
        // ),
      ),
    );
  }
}
