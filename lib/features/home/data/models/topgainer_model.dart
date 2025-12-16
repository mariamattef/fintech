import 'package:fintech/features/home/domain/enteties/topgainer_entity.dart';

class TopgainerModel extends TopgainerEntity {
  int? marketCap;
  int? marketCapRank;
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

  TopgainerModel({
    super.id,
    super.symbol,
    super.name,
    super.imageUrl,
    super.currentPrice,
    super.priceChangePercentage24h,
    this.marketCap,
    this.marketCapRank,
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

  factory TopgainerModel.fromJson(Map<String, dynamic> json) => TopgainerModel(
    id: json['id'] as String?,
    symbol: json['symbol'] as String?,
    name: json['name'] as String?,
    imageUrl: json['image'] as String?,
    currentPrice: (json['current_price'] as num?)?.toDouble(),
    marketCap: (json['market_cap'] as num?)?.toInt(),
    marketCapRank: (json['market_cap_rank'] as num?)?.toInt(),
    fullyDilutedValuation: (json['fully_diluted_valuation'] as num?)?.toInt(),
    totalVolume: (json['total_volume'] as num?)?.toInt(),
    high24h: (json['high_24h'] as num?)?.toInt(),
    low24h: (json['low_24h'] as num?)?.toInt(),
    priceChange24h: (json['price_change_24h'] as num?)?.toDouble(),
    priceChangePercentage24h: (json['price_change_percentage_24h'] as num?)
        ?.toDouble(),
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
}
