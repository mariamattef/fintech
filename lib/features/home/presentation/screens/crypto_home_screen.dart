import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/features/home/presentation/widgets/balance_cart_widget.dart';
import 'package:fintech/features/home/presentation/widgets/header_widget.dart';
import 'package:fintech/features/home/presentation/widgets/stat_cart_widget.dart';
import 'package:fintech/features/home/presentation/widgets/text_header_home.dart';
import 'package:fintech/features/home/presentation/widgets/trending_section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CryptoHomeScreen extends StatefulWidget {
  static const String routeName = RoutesContants.home;

  const CryptoHomeScreen({super.key});

  @override
  State<CryptoHomeScreen> createState() => _CryptoHomeScreenState();
}

class _CryptoHomeScreenState extends State<CryptoHomeScreen> {
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
                TextHeaderHome(header: "Market Overview"),
                Gap(15.h),
                MarketOverviewGridWidget(),
                Gap(15.h),
                TrendingSectionHeader(title: "Trending Now", onPressed: () {}),
                Gap(15.h),
                SizedBox(height: 130.h, child: TrendingListWidget()),
                Gap(20.h),
                TextHeaderHome(header: "Top Gainers"),
                Gap(20.h),
                TopGainersList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildTopGainersList() {
  //   return Column(
  //     children: [
  //       _buildGainerTile(
  //         "Ethereum",
  //         "ETH",
  //         "\$20,788",
  //         "+0.25%",
  //         Icons.diamond_outlined,
  //       ),
  //       const SizedBox(height: 10),
  //       _buildGainerTile(
  //         "Binance Coin",
  //         "BNS",
  //         "\$20,788",
  //         "+1.15%",
  //         Icons.hexagon_outlined,
  //       ),
  //       const SizedBox(height: 10),
  //       _buildGainerTile(
  //         "Litecoin",
  //         "LTC",
  //         "\$20,788",
  //         "+1.15%",
  //         Icons.flash_on,
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildGainerTile(
  //   String name,
  //   String symbol,
  //   String price,
  //   String change,
  //   IconData icon,
  // ) {
  //   return Container(
  //     padding: EdgeInsets.all(12),
  //     decoration: BoxDecoration(
  //       color: Theme.of(context).colorScheme.surface,
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     child: Row(
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.all(10),
  //           decoration: BoxDecoration(
  //             color: Colors.grey.withValues(alpha: 0.1),
  //             borderRadius: BorderRadius.circular(12),
  //           ),
  //           child: Icon(icon, color: const Color(0xFF1A2C4F), size: 24),
  //         ),
  //         const Gap(15),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               name,
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: Theme.of(context).colorScheme.primary,
  //                 fontSize: 16.sp,
  //               ),
  //             ),
  //             Gap(4),
  //             Text(
  //               symbol,
  //               style: TextStyle(color: Color(0xff949494), fontSize: 12.sp),
  //             ),
  //           ],
  //         ),
  //         const Spacer(),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           children: [
  //             Text(
  //               price,
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: Theme.of(context).colorScheme.primary,
  //                 fontSize: 16,
  //               ),
  //             ),
  //             Gap(4),
  //             Text(
  //               change,
  //               style: const TextStyle(
  //                 color: Color(0xff7DDDA4),
  //                 fontSize: 12,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class MarketOverviewGridWidget extends StatelessWidget {
  const MarketOverviewGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              StatCartWidget(
                title: "Market Cap",
                value: "\$2.1T",
                change: "+2.35%",
              ),

              const SizedBox(height: 15),
              StatCartWidget(
                title: "BTC Dominance",
                value: "48.5%",
                change: null,
              ),
            ],
          ),
        ),
        Gap(15.h),
        Expanded(
          child: Column(
            children: [
              StatCartWidget(
                title: "24h Volume",
                value: "\$85.5B",
                change: "+2.35%",
              ),

              Gap(15.h),
              StatCartWidget(
                title: "Active Coins",
                value: "19.417",
                change: null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TrendingCardWidget extends StatelessWidget {
  final String name, symbol, price, change;
  final Color iconColor;

  const TrendingCardWidget({
    super.key,
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesContants.coinDetails);
      },
      child: Container(
        width: 190.w,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const Spacer(),
                Icon(Icons.currency_bitcoin, color: iconColor, size: 20),
              ],
            ),
            Gap(4.h),
            Text(
              symbol,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Gap(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                // Gap(20.w),
                Text(
                  "$change ▴",
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color(0xff6079FA)
                        : Color(0xff4766F9),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TrendingListWidget extends StatelessWidget {
  const TrendingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 10.0.w),
          child: TrendingCardWidget(
            name: "Ethereum",
            symbol: "ETH",
            price: "1,132,151",
            change: "+2.35%",
            iconColor: Colors.deepPurple,
          ),
        );
      },
    );
  }
}

class GainerTileWidget extends StatelessWidget {
  final String name, symbol, price, change;
  final IconData icon;
  const GainerTileWidget({
    super.key,
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF1A2C4F), size: 24),
          ),
          const Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16.sp,
                ),
              ),
              Gap(4),
              Text(
                symbol,
                style: TextStyle(color: Color(0xff949494), fontSize: 12.sp),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),
              Gap(4),
              Text(
                change,
                style: const TextStyle(
                  color: Color(0xff7DDDA4),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TopGainersList extends StatelessWidget {
  const TopGainersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: GainerTileWidget(
            name: "Ethereum",
            symbol: "ETH",
            price: "\$20,788",
            change: "+0.25%",
            icon: Icons.diamond_outlined,
          ),
        );
      },
    );
  }
}
