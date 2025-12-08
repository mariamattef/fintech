import 'package:fintech/core/config/assets.dart';
import 'package:fintech/core/di/service_locator.dart';
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/features/home/presentation/cubits/trending_cubit/trending_cubit.dart';
import 'package:fintech/features/home/presentation/cubits/overview_cubit/overview_cubit.dart';
import 'package:fintech/features/home/presentation/screens/crypto_home_screen.dart';
import 'package:fintech/features/market/presentation/screens/market_screen.dart';
import 'package:fintech/features/portfolio/presentation/screens/portfolio_screen.dart';
import 'package:fintech/features/settings/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Root extends StatefulWidget {
  static const String routeName = RoutesContants.root;
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late final List<Widget> pages;
  int _currentIndex = 0;
  late final PageController controller;
  @override
  void initState() {
    super.initState();
    pages = [
      const CryptoHomeScreen(),
      const MarketScreen(),
      const PortfolioScreen(),
      const SettingsScreen(),
    ];
    controller = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<MarketOverviewCubit>()..getOverview(),
        ),
        BlocProvider(
          create: (context) => sl<TrendingCubit>()..fatchTrending(),
        ),
      ],
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: pages,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: SizedBox(
            height: 87.h,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              onTap: (index) {
                _currentIndex = index;
                controller.jumpToPage(index);
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 6.0.h),
                    child: SvgPicture.asset(AppAssets.home),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(bottom: 4.0.h),
                    child: SvgPicture.asset(
                      AppAssets.homeFilled,
                      colorFilter: ColorFilter.mode(
                        Theme.of(
                          context,
                        ).bottomNavigationBarTheme.selectedItemColor!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 6.0.h),
                    child: SvgPicture.asset(AppAssets.chart),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(bottom: 4.0.h),
                    child: SvgPicture.asset(
                      AppAssets.chartFilled,
                      colorFilter: ColorFilter.mode(
                        Theme.of(
                          context,
                        ).bottomNavigationBarTheme.selectedItemColor!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  label: 'Market',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 6.0.h),
                    child: SvgPicture.asset(AppAssets.briefcase),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(bottom: 4.0.h),
                    child: SvgPicture.asset(
                      AppAssets.briefcaseFilled,
                      colorFilter: ColorFilter.mode(
                        Theme.of(
                          context,
                        ).bottomNavigationBarTheme.selectedItemColor!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  label: 'Portfolio',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 6.0.h),
                    child: SvgPicture.asset(AppAssets.setting),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(bottom: 4.0.h),
                    child: SvgPicture.asset(
                      AppAssets.settingFilled,
                      colorFilter: ColorFilter.mode(
                        Theme.of(
                          context,
                        ).bottomNavigationBarTheme.selectedItemColor!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
