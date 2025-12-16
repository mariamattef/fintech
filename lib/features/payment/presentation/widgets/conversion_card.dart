import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/features/payment/presentation/widgets/amount_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ConversionCard extends StatelessWidget {
  final String payAmount;
  final String receiveAmount;
  final String rate;

  const ConversionCard({
    super.key,
    required this.payAmount,
    required this.receiveAmount,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          AmountRow(
            title: 'You Pay',
            amount: receiveAmount,
            code: 'USD',
            icon: Icons.attach_money,
          ),
          Gap(15.h),
          _buildSwapDivider(),
          Gap(15.h),
          AmountRow(
            title: "You Receive",
            amount: receiveAmount,
            code: 'ETH',
            icon: Icons.diamond_outlined,
          ),

          Gap(25.h),
          _buildRateText(),
        ],
      ),
    );
  }

  Widget _buildSwapDivider() {
    return Row(
      children: [
        Expanded(
          child: const Divider(
            color: Color(0xff5E5E5E),
            thickness: 1,
            endIndent: 10,
          ),
        ),
        SvgPicture.asset("assets/svg/icons/Swap.svg"),
        Expanded(
          child: const Divider(
            color: Color(0xff5E5E5E),
            thickness: 1,
            indent: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildRateText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.circle, size: 8, color: Colors.orange),
        Gap(15.w),
        Text(
          rate,
          style: AppTextStyles.sMedium.copyWith(color: Color(0xff949494)),
        ),
      ],
    );
  }
}
