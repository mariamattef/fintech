import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/features/home/presentation/widgets/balance_cart_widget.dart';
import 'package:fintech/features/portfolio/presentation/cubit/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/di/service_locator.dart';
import '../../presentation/cubit/portfolio_cubit.dart';
import '../widgets/holdings_list.dart';
import '../widgets/month_selector.dart';
import '../widgets/portfolio_header.dart';
import '../widgets/portfolio_pie_chart.dart';
import '../widgets/transactions_list.dart';

class PortfolioScreen extends StatefulWidget {
  static const String routeName = RoutesContants.portfolio;
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TransactionCubit>()..fetchTransactions(),
      child: Scaffold(
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
                BlocBuilder<PortfolioCubit, PortfolioState>(
                  builder: (context, state) {
                    if (state is PortfolioLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is PortfolioLoaded) {
                      return Column(
                        children: [
                          PortfolioPieChart(cryptoPrices: state.cryptoPrices),
                          Gap(20.h),
                          HoldingsList(cryptoPrices: state.cryptoPrices),
                        ],
                      );
                    } else if (state is PortfolioError) {
                      return Center(child: Text('Error: ${state.message}'));
                    }
                    return const SizedBox.shrink(); // Initial or other states
                  },
                ),
                Gap(20.h),
                // PortfolioPieChart(), // Moved inside BlocBuilder or adapt as needed
                // HoldingsList(), // Moved inside BlocBuilder or adapt as needed
                TransactionsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
