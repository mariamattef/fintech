import 'package:fintech/features/market/domain/entities/crypto_entity.dart';

class CryptoModel extends CryptoEntity {
  int? marketCap;
  int? fullyDilutedValuation;
  int? totalVolume;
  int? high24h;
  int? low24h;
  double? priceChange24h;
  double? marketCapChange24h;
  double? marketCapChangePercentage24h;
  int? circulatingSupply;
  int? totalSupply;
  int? maxSupply;
  int? ath;
  double? athChangePercentage;
  DateTime? athDate;
  double? atl;
  double? atlChangePercentage;
  DateTime? atlDate;
  dynamic roi;
  DateTime? lastUpdated;

  CryptoModel({
    required super.id,
    required super.symbol,
    required super.name,
    required super.image,
    required super.currentPrice,
    required super.marketCapRank,
    required super.priceChangePercentage24h,
    this.marketCap,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24h,
    this.low24h,
    this.priceChange24h,
    this.marketCapChange24h,
    this.marketCapChangePercentage24h,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) => CryptoModel(
    id: json['id'] as String,
    symbol: json['symbol'] as String,
    name: json['name'] as String,
    image: json['image'] as String,
    currentPrice: json['current_price'] as num,
    marketCap: (json['market_cap'] as num?)?.toInt(),
    marketCapRank: (json['market_cap_rank'] as num).toInt(),
    fullyDilutedValuation: (json['fully_diluted_valuation'] as num?)?.toInt(),
    totalVolume: (json['total_volume'] as num?)?.toInt(),
    high24h: (json['high_24h'] as num?)?.toInt(),
    low24h: (json['low_24h'] as num?)?.toInt(),
    priceChange24h: (json['price_change_24h'] as num?)?.toDouble(),
    priceChangePercentage24h:
        (json['price_change_percentage_24h'] as num?)?.toDouble() ?? 0.0,
    marketCapChange24h: (json['market_cap_change_24h'] as num?)?.toDouble(),
    marketCapChangePercentage24h:
        (json['market_cap_change_percentage_24h'] as num?)?.toDouble(),
    circulatingSupply: (json['circulating_supply'] as num?)?.toInt(),
    totalSupply: (json['total_supply'] as num?)?.toInt(),
    maxSupply: (json['max_supply'] as num?)?.toInt(),
    ath: (json['ath'] as num?)?.toInt(),
    athChangePercentage: (json['ath_change_percentage'] as num?)?.toDouble(),
    athDate: json['ath_date'] == null
        ? null
        : DateTime.parse(json['ath_date'] as String),
    atl: (json['atl'] as num?)?.toDouble(),
    atlChangePercentage: (json['atl_change_percentage'] as num?)?.toDouble(),
    atlDate: json['atl_date'] == null
        ? null
        : DateTime.parse(json['atl_date'] as String),
    roi: json['roi'] as dynamic,
    lastUpdated: json['last_updated'] == null
        ? null
        : DateTime.parse(json['last_updated'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'symbol': symbol,
    'name': name,
    'image': image,
    'current_price': currentPrice,
    'market_cap': marketCap,
    'market_cap_rank': marketCapRank,
    'fully_diluted_valuation': fullyDilutedValuation,
    'total_volume': totalVolume,
    'high_24h': high24h,
    'low_24h': low24h,
    'price_change_24h': priceChange24h,
    'price_change_percentage_24h': priceChangePercentage24h,
    'market_cap_change_24h': marketCapChange24h,
    'market_cap_change_percentage_24h': marketCapChangePercentage24h,
    'circulating_supply': circulatingSupply,
    'total_supply': totalSupply,
    'max_supply': maxSupply,
    'ath': ath,
    'ath_change_percentage': athChangePercentage,
    'ath_date': athDate?.toIso8601String(),
    'atl': atl,
    'atl_change_percentage': atlChangePercentage,
    'atl_date': atlDate?.toIso8601String(),
    'roi': roi,
    'last_updated': lastUpdated?.toIso8601String(),
  };
}
