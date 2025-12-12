import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/core/widgets/custom_elevation_botton.dart';
import 'package:fintech/features/payment/presentation/widgets/conversion_card.dart';
import 'package:fintech/features/payment/presentation/widgets/free_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BuyCryptoScreen extends StatefulWidget {
  static const String routeName = RoutesContants.buyCrypto;
  const BuyCryptoScreen({super.key});

  @override
  State<BuyCryptoScreen> createState() => _BuyCryptoScreenState();
}

class _BuyCryptoScreenState extends State<BuyCryptoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleTextStyle: AppTextStyles.headingH4.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Buy Crypto"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: Column(
          children: [
            Gap(20),
            const ConversionCard(
              payAmount: "\$1,800.00",
              receiveAmount: "0.9876",
              rate: "1 USD = 0.00078 ETH",
            ),
            Gap(15.h),
            const FeeSection(),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding:  EdgeInsets.only(left: 20.0.w, right: 20.0.w,bottom: 20.h),
        child: CustomElevationBottom(
          text: 'Continue',
          onPressed: () {
            Navigator.pushNamed(context, RoutesContants.paymentMethod);
          },
        ),
      ),
    );
  }
}
