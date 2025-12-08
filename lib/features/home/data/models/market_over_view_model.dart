import 'package:fintech/features/home/domain/enteties/market_over_view_entity.dart';

class MarketOverviewModel extends MarketOverviewEntity {
  MarketOverviewModel({
    required super.activeCryptocurrencies,
    required super.markets,
    required super.totalMarketCap,
    required super.totalVolume,
    required super.marketCapPercentage,
    super.marketCapChangePercentage24hUsd,
  });

  factory MarketOverviewModel.fromJson(Map<String, dynamic> json) {
    return MarketOverviewModel(
      activeCryptocurrencies: json['active_cryptocurrencies'],
      markets: json['markets'],
      totalMarketCap: (json['total_market_cap'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, (value as num).toDouble()),
      ),
      totalVolume: (json['total_volume'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, (value as num).toDouble()),
      ),
      marketCapPercentage:
          (json['market_cap_percentage'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, (value as num).toDouble()),
      ),
      marketCapChangePercentage24hUsd:
          json['market_cap_change_percentage_24h_usd']?.toDouble() ?? 0.0,
    );
  }
}
