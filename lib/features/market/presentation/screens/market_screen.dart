import 'package:fintech/core/di/service_locator.dart';
import 'package:fintech/core/params/params.dart';
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/features/market/presentation/cubits/crypto_cubit/crypto_cubit.dart';
import 'package:fintech/features/market/presentation/cubits/crypto_cubit/crypto_state.dart';
import 'package:fintech/features/market/presentation/widgets/crypto_list_item.dart';
import 'package:fintech/features/market/presentation/widgets/custom_content_appbar.dart';
import 'package:fintech/features/market/presentation/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MarketScreen extends StatefulWidget {
  static const String routeName = RoutesContants.market;

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
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<CryptoCubit>().getCryptos(
      params: CryptoMarketParams(page: _currentPage),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _currentPage++;
      context.read<CryptoCubit>().getCryptos(
        params: CryptoMarketParams(page: _currentPage),
        isLoadMore: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: CustomContentAppBar(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10.h),
            SearchBartWidget(),
            Gap(20.h),
            SizedBox(
              height: 40.h,
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
                                ? (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.black
                                      : Colors.white)
                                : (Theme.of(context).brightness ==
                                          Brightness.dark
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
              child: BlocBuilder<CryptoCubit, CryptoState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox(),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    success: (cryptos, currentPage, hasMore) {
                      return ListView.builder(
                        controller: _scrollController,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0.w,
                          vertical: 10.0.h,
                        ),
                        itemCount: cryptos.length + (hasMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == cryptos.length) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final crypto = cryptos[index];
                          return CryptoListItem(
                            id: crypto.id,
                            name: crypto.name,
                            symbol: crypto.symbol,
                            rank: crypto.marketCapRank,
                            price: crypto.currentPrice.toString(),
                            change: crypto.priceChangePercentage24h.toDouble(),
                            // isPositive: crypto.priceChangePercentage24h >= 0,
                            image: crypto.image,
                          );
                        },
                      );
                    },
                    error: (message) => Center(child: Text(message)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
