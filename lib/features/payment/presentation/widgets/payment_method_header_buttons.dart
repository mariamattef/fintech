import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodHeaderButtons extends StatelessWidget {
  final String visaSvg;
  final String masterSvg;
  final String appleSvg;

  const PaymentMethodHeaderButtons({
    super.key,
    required this.visaSvg,
    required this.masterSvg,
    required this.appleSvg,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _singleButton(
          context: context,
          svgPath: visaSvg,
          applyColor: true,
          isDark: isDark,
        ),
        _singleButton(
          context: context,
          svgPath: masterSvg,
          applyColor: false,
          isDark: isDark,
          vlue: 5.r,
        ),
        _singleButton(
          context: context,
          svgPath: appleSvg,
          applyColor: true,
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _singleButton({
    required BuildContext context,
    required String svgPath,
    required bool applyColor,
    required bool isDark,
    double vlue = 0,
  }) {
    return Container(
      height: 35.h,
      width: 90.w,
      padding: EdgeInsets.all(vlue),
      decoration: BoxDecoration(
        color: isDark ? Colors.white : Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: SvgPicture.asset(
        svgPath,
        height: 100.w.h,
        width: 100.w,
        fit: BoxFit.contain,
        colorFilter: applyColor
            ? ColorFilter.mode(
                isDark ? Colors.black : Colors.white,
                BlendMode.srcIn,
              )
            : null,
      ),
    );
  }
}
