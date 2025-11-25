import 'package:fintech/features/home/presentation/screens/crypto_home_screen.dart';
import 'package:fintech/features/market/presentation/screens/market_screen.dart';
import 'package:fintech/features/portfolio/presentation/screens/portfolio_screen.dart';
import 'package:fintech/features/settings/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Root extends StatefulWidget {
  static const String routeName = '/root';
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late List<Widget> pages;
  int _currentIndex = 0;
  late PageController? controller;
  @override
  void initState() {
    pages = [
      CryptoHomeScreen(),
      MarketScreen(),
      PortfolioScreen(),
      SettingsScreen(),
    ];
    controller = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            currentIndex: _currentIndex,
            onTap: (index) {
              _currentIndex = index;
              controller!.jumpToPage(index);
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6.0.h),
                  child: SvgPicture.asset('assets/svg/icons/home.svg'),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 6.0.h),
                  child: SvgPicture.asset(
                    'assets/svg/icons/home_filled.svg',
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
                  child: SvgPicture.asset('assets/svg/icons/chart.svg'),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 6.0.h),
                  child: SvgPicture.asset(
                    'assets/svg/icons/chart_filled.svg',
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
                  child: SvgPicture.asset('assets/svg/icons/briefcase.svg'),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 6.0.h),
                  child: SvgPicture.asset(
                    'assets/svg/icons/briefcase_filled.svg',
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
                  child: SvgPicture.asset('assets/svg/icons/setting.svg'),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 6.0.h),
                  child: SvgPicture.asset(
                    'assets/svg/icons/setting_filled.svg',
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
    );
  }
}
