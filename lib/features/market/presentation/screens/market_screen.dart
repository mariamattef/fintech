import 'package:fintech/features/market/presentation/widgets/crypto_list_item.dart';
import 'package:fintech/features/market/presentation/widgets/custom_content_appbar.dart';
import 'package:fintech/features/market/presentation/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MarketScreen extends StatefulWidget {
  static const String routeName = '/market';

  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final List<String> _filters = [
    'All',
    'DeFi',
    'NFT',
    'Gaming',
    'Metaverse',
    'Web3',
    'AI',
  ];
  String _selectedFilter = 'All';
  final List<Map<String, dynamic>> _cryptoList = [
    {
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'rank': 1,
      'price': '54,382.64',
      'change': '+15.3%',
      'isPositive': true,
      'icon': Icons.currency_bitcoin, // Placeholder
      'iconColor': Colors.orange,
    },
    {
      'name': 'Ethereum',
      'symbol': 'ETH',
      'rank': 2,
      'price': '4,145.61',
      'change': '-2.1%',
      'isPositive': false,
      'icon': Icons.diamond_outlined, // Placeholder
      'iconColor': Colors.deepPurple,
    },
    {
      'name': 'Litecoin',
      'symbol': 'LTC',
      'rank': 3,
      'price': '207.3',
      'change': '-1.1%',
      'isPositive': false,
      'icon': Icons.flash_on, // Placeholder
      'iconColor': Colors.blueGrey,
    },
    {
      'name': 'Solana',
      'symbol': 'SOL',
      'rank': 4,
      'price': '227.93',
      'change': '+15.3%',
      'isPositive': true,
      'icon': Icons.flare_outlined, // Placeholder
      'iconColor': Colors.purple,
    },
    {
      'name': 'Binance Coin',
      'symbol': 'BNB',
      'rank': 5,
      'price': '610.5',
      'change': '+2.35%',
      'isPositive': true,
      'icon': Icons.hexagon_outlined, // Placeholder
      'iconColor': Colors.amber,
    },
    {
      'name': 'Ripple',
      'symbol': 'XRP',
      'rank': 6,
      'price': '1.0358',
      'change': '+15.3%',
      'isPositive': true,
      'icon': Icons.cancel_outlined, // Placeholder
      'iconColor': Colors.blueAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomContentAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBartWidget(),
          Gap(20),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.0.h),
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                final filter = _filters[index];
                final isSelected = _selectedFilter == filter;
                return Padding(
                  padding: EdgeInsets.only(right: 10.0.h),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      label: Text(
                        filter,
                        style: TextStyle(
                          color: isSelected
                              ? (Theme.of(context).brightness == Brightness.dark
                                    ? Colors.black
                                    : Colors.white)
                              : (Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : const Color(0xFF1E1F4B)),
                        ),
                      ),
                      backgroundColor: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.surface,
                      padding: EdgeInsets.symmetric(horizontal: 10.0.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0.r),
                        side: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              itemCount: _cryptoList.length,
              itemBuilder: (context, index) {
                final crypto = _cryptoList[index];
                return CryptoListItem(
                  name: crypto['name'],
                  symbol: crypto['symbol'],
                  rank: crypto['rank'],
                  price: crypto['price'],
                  change: crypto['change'],
                  isPositive: crypto['isPositive'],
                  icon: crypto['icon'],
                  iconColor: crypto['iconColor'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
