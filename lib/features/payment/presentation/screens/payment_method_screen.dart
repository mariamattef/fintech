import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/core/widgets/custom_elevation_botton.dart';
import 'package:fintech/features/payment/presentation/widgets/payment_card.dart';
import 'package:fintech/features/payment/presentation/widgets/payment_method_header_buttons.dart';
import 'package:fintech/features/payment/presentation/widgets/payment_switch_tile.dart';
import 'package:fintech/features/payment/presentation/widgets/payment_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PaymentMethodScreen extends StatelessWidget {
  static const String routeName = RoutesContants.paymentMethod;
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleTextStyle: AppTextStyles.headingH4.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Payment method"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                children: [
                  _buildTitleRow(context),
                  Gap(16.h),
                  PaymentMethodHeaderButtons(
                    visaSvg: "assets/svg/icons/Frame 427319754.svg",
                    masterSvg: "assets/svg/icons/Frame 427319753.svg",
                    appleSvg: "assets/svg/icons/Frame 427319752.svg",
                  ),

                  Gap(20.h),

                  PaymentCard(imagePath: "assets/images/card.png"),
                ],
              ),
            ),

            Gap(20.h),

            PaymentTile(title: "Google Pay", onTap: () {}),

            Gap(20.h),

            PaymentTile(title: "Mobile Banking", onTap: () {}),

            Gap(20.h),

            PaymentSwitchTile(
              title: "Send receipt to your email",
              value: true,
              onChanged: (v) {},
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding:  EdgeInsets.only(left: 20.0.w, right: 20.0.w,bottom: 20.h),
        child: CustomElevationBottom(text: 'Buy', onPressed: () {}),
      ),

    );
  }

  Widget _buildTitleRow(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Credit Card",
          style: AppTextStyles.headingH5.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Icon(Icons.keyboard_arrow_down, color: Colors.white),
      ],
    );
  }
}
