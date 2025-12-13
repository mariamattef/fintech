import '../../domain/entities/crypto_currency.dart';

class CryptoPriceModel extends CryptoCurrency {
  const CryptoPriceModel({
    required super.id,
    required super.usdPrice,
    required super.usd24hrChange,
    super.image,
  });

  factory CryptoPriceModel.fromMarketsJson(Map<String, dynamic> json) {
    return CryptoPriceModel(
      id: json['id'],
      usdPrice: (json['current_price'] as num).toDouble(),
      usd24hrChange: (json['price_change_percentage_24h'] ?? 0.0).toDouble(),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'current_price': usdPrice,
      'price_change_percentage_24h': usd24hrChange,
      'image': image,
    };
  }
}