import 'package:easy_localization/easy_localization.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthSelector extends StatefulWidget {
  const MonthSelector({super.key});

  @override
  State<MonthSelector> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  int selected = 1; // Dec

  final months = ["Nov".tr(), "Dec".tr(), "Jan".tr(), "Feb".tr(), "Mar".tr(), "Apr".tr()];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        months.length,
        (i) => GestureDetector(
          onTap: () => setState(() => selected = i),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: selected==i ? Theme.of(context).colorScheme.surface:null,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              months[i],
              style: AppTextStyles.textst12.copyWith(
                color: selected == i
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).brightness == Brightness.dark
                    ? Color.fromRGBO(73, 77, 88, 1)
                    : Color.fromRGBO(73, 77, 88, 1),
                fontWeight: selected == i ? FontWeight.bold : FontWeight.normal,
              ),
              //  TextStyle(
              //   fontSize: 16,
              //   color: selected == i ? Colors.white : Colors.grey,
              //   fontWeight: selected == i ? FontWeight.bold : FontWeight.normal,
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
