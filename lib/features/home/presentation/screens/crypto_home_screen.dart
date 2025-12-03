import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/features/market/presentation/screens/coin_details_screen.dart';
import 'package:fintech/features/home/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CryptoHomeScreen extends StatefulWidget {
  static const String routeName = '/crypto-home';

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
                HeaderWidget(
                  img: 'https://i.pravatar.cc/150?img=11',
                  name: 'Ahmed',
                ),
                Gap(25.r),

                BalanceCardWidget(),
                const SizedBox(height: 25),
                const Text(
                  "Market Overview",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A2C4F),
                  ),
                ),
                const SizedBox(height: 15),
                _buildMarketOverviewGrid(),
                const SizedBox(height: 25),
                _buildSectionHeader("Trending Now", () {}),
                const SizedBox(height: 15),
                _buildTrendingList(),
                const SizedBox(height: 25),
                const Text(
                  "Top Gainers",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A2C4F),
                  ),
                ),
                const SizedBox(height: 15),
                _buildTopGainersList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildBalanceCard() {
  //   return

  // }

  Widget _buildMarketOverviewGrid() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              _buildStatCard("Market Cap", "\$2.1T", "+2.35%"),
              const SizedBox(height: 15),
              _buildStatCard("BTC Dominance", "48.5%", null),
            ],
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            children: [
              _buildStatCard("24h Volume", "\$85.5B", "+2.35%"),
              const SizedBox(height: 15),
              _buildStatCard("Active Coins", "19.417", null),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, String? change) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF1A2C4F),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (change != null) ...[
            const SizedBox(height: 5),
            Text(
              "$change ▴",
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onTapViewAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A2C4F),
          ),
        ),
        TextButton(
          onPressed: onTapViewAll,
          child: const Text("View all", style: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }

  Widget _buildTrendingList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none, // Allows shadow to show outside bounds
      child: Row(
        children: [
          _buildTrendingCard(
            "Bitcoin",
            "BTC",
            "1,132,151",
            "+2.35%",
            Colors.orange,
          ),
          const SizedBox(width: 15),
          _buildTrendingCard(
            "Ethereum",
            "ETH",
            "1,132,151",
            "+2.35%",
            Colors.deepPurple,
          ),
          const SizedBox(width: 15),
          _buildTrendingCard(
            "Solana",
            "SOL",
            "140,12",
            "-1.2%",
            Colors.purpleAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingCard(
    String name,
    String symbol,
    String price,
    String change,
    Color iconColor,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CoinDetailsScreen.routeName);
      },
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A2C4F),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.currency_bitcoin,
                  color: iconColor,
                  size: 20,
                ), // Using generic icon for demo
              ],
            ),
            const SizedBox(height: 4),
            Text(
              symbol,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 20),
            Text(
              price,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF1A2C4F),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "$change ▴",
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopGainersList() {
    return Column(
      children: [
        _buildGainerTile(
          "Ethereum",
          "ETH",
          "\$20,788",
          "+0.25%",
          Icons.diamond_outlined,
        ),
        const SizedBox(height: 10),
        _buildGainerTile(
          "Binance Coin",
          "BNS",
          "\$20,788",
          "+1.15%",
          Icons.hexagon_outlined,
        ),
        const SizedBox(height: 10),
        _buildGainerTile(
          "Litecoin",
          "LTC",
          "\$20,788",
          "+1.15%",
          Icons.flash_on,
        ),
      ],
    );
  }

  Widget _buildGainerTile(
    String name,
    String symbol,
    String price,
    String change,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF1A2C4F), size: 24),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A2C4F),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                symbol,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A2C4F),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                change,
                style: const TextStyle(
                  color: Colors.green,
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

class BalanceCardWidget extends StatelessWidget {
  const BalanceCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2C3E65),
            Color(0xFF1A2C4F), // Darker Navy
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A2C4F).withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Current Balance",
            style: AppTextStyles.sSemiBold.copyWith(color: Color(0xFFF5F8FE))
          ),
          const SizedBox(height: 10),
          const Text(
            "\$143,421.20",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Weekly Profit ",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                Text(
                  "2,35% ▴",
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
