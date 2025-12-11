class CryptoDetailsEntity {
  final String id;
  final String name;
  final String image;
  final double currentPrice;
  final double marketCap;
  final double volume24h;
  final double availableSupply;
  final double? maxSupply;
  final String description;

  const CryptoDetailsEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.volume24h,
    required this.availableSupply,
    required this.maxSupply,
    required this.description,
  });
}
