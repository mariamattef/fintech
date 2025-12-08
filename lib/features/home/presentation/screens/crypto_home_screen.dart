import 'package:easy_localization/easy_localization.dart';
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/features/home/presentation/cubits/overview_cubit/overview_cubit.dart';
import 'package:fintech/features/home/presentation/cubits/overview_cubit/overview_state.dart';
import 'package:fintech/features/home/presentation/cubits/trending_cubit/trending_cubit.dart';
import 'package:fintech/features/home/presentation/cubits/trending_cubit/trending_state.dart';
import 'package:fintech/features/home/presentation/widgets/balance_cart_widget.dart';
import 'package:fintech/features/home/presentation/widgets/header_widget.dart';
import 'package:fintech/features/home/presentation/widgets/market_overview_grid_widget.dart';
import 'package:fintech/features/home/presentation/widgets/text_header_home.dart';
import 'package:fintech/features/home/presentation/widgets/top_gainer_list.dart';
import 'package:fintech/features/home/presentation/widgets/trending_list_widget.dart';
import 'package:fintech/features/home/presentation/widgets/trending_section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CryptoHomeScreen extends StatefulWidget {
  static const String routeName = RoutesContants.home;

  const CryptoHomeScreen({super.key});

  @override
  State<CryptoHomeScreen> createState() => _CryptoHomeScreenState();
}

class _CryptoHomeScreenState extends State<CryptoHomeScreen> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      context.read<MarketOverviewCubit>().getOverview();
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderWidget(),
                Gap(25.r),
                BalanceCardWidget(),
                Gap(25.h),
                TextHeaderHome(header: "marketOverview".tr()),
                Gap(15.h),
                BlocBuilder<MarketOverviewCubit, MarketOverviewState>(
                  builder: (context, state) {
                    if (state is MarketOverviewLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is MarketOverviewSuccess) {
                      return MarketOverviewGridWidget(
                        overviewEntity: state.data,
                      );
                    } else if (state is MarketOverviewError) {
                      return Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),

                Gap(15.h),
                TrendingSectionHeader(
                  title: "trendingNow".tr(),
                  onPressed: () {},
                ),
                Gap(15.h),
                SizedBox(
                  height: 130.h,
                  child: BlocBuilder<TrendingCubit, TrendingState>(
                    builder: (context, state) {
                      if (state is TrendingLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is TrendingSuccess) {
                        return TrendingListWidget(trendingEntity: state.data, );
                      } else if (state is TrendingError) {
                        return Text(
                          state.message,
                          style: const TextStyle(color: Colors.red),
                        );
                      }

                      return SizedBox.shrink();
                    },
                  ),
                ),
                Gap(20.h),
                TextHeaderHome(header: "topGainers".tr()),
                Gap(20.h),
                TopGainersList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
