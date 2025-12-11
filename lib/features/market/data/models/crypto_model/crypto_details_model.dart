import 'package:fintech/features/market/domain/entities/crypto_details_entity.dart';

class CryptoDetailsModel extends CryptoDetailsEntity {
  const CryptoDetailsModel({
    required super.id,
    required super.name,
    required super.image,
    required super.currentPrice,
    required super.marketCap,
    required super.volume24h,
    required super.availableSupply,
    required super.maxSupply,
    required super.description,
  });

  factory CryptoDetailsModel.fromJson(Map<String, dynamic> json) {
    return CryptoDetailsModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image']?['large'] ?? '',
      currentPrice:
          json['market_data']?['current_price']?['usd']?.toDouble() ?? 0.0,
      marketCap: json['market_data']?['market_cap']?['usd']?.toDouble() ?? 0.0,
      volume24h:
          json['market_data']?['total_volume']?['usd']?.toDouble() ?? 0.0,
      availableSupply:
          json['market_data']?['circulating_supply']?.toDouble() ?? 0.0,
      maxSupply: json['market_data']?['max_supply']?.toDouble(),
      description: json['description']?['en'] ?? '',
    );
  }
}
