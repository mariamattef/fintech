class CryptoEntity {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final num currentPrice;
  final int marketCapRank;
  final num priceChangePercentage24h;

  const CryptoEntity({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCapRank,
    required this.priceChangePercentage24h,
  });
}
