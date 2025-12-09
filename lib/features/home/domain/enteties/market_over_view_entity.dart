class MarketOverviewEntity {
  final int activeCryptocurrencies;
  final int markets;
  final Map<String, double> totalMarketCap;
  final Map<String, double> totalVolume;
  final Map<String, double> marketCapPercentage;
  final double? marketCapChangePercentage24hUsd;

  MarketOverviewEntity({
    required this.activeCryptocurrencies,
    required this.markets,
    required this.totalMarketCap,
    required this.totalVolume,
    required this.marketCapPercentage,
    this.marketCapChangePercentage24hUsd,
  });
}
