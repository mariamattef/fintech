import 'package:fintech/features/home/domain/enteties/trending_entity.dart';

class TrendingModel extends TrendingEntity {
  TrendingModel({
    required super.name,
    required super.symbol,
    required super.priceBtc,
    required super.change,
    required super.imgThumb,
  });
  factory TrendingModel.fromJson(Map<String, dynamic> json) {
    return TrendingModel(
      name: json['name'] ?? '',
      symbol: json['symbol'] ?? '',
      priceBtc: (json['price_btc'] as num? ?? 0).toDouble(),
      change: (json['price_change_percentage_24h'] ?? '0').toString(),
      imgThumb: json['thumb'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'symbol': symbol,
      'price_btc': priceBtc,
      'price_change_percentage_24h': change,
      'thumb': imgThumb,
    };
  }
}
