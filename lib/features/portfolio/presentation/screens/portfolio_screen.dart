import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/features/home/presentation/widgets/balance_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../widgets/holdings_list.dart';
import '../widgets/month_selector.dart';
import '../widgets/portfolio_header.dart';
import '../widgets/portfolio_pie_chart.dart';
import '../widgets/transactions_list.dart';

class PortfolioScreen extends StatelessWidget {
  static const String routeName = RoutesContants.portfolio;
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PortfolioHeader(),
              Gap(30.h),
              BalanceCardWidget(),
              Gap(25.h),
              MonthSelector(),
              Gap(20.h),
              PortfolioPieChart(),
              Gap(20.h),
              HoldingsList(),
              Gap(20.h),
              TransactionsList(),
            ],
          ),
        ),
      ),
    );
  }
}
