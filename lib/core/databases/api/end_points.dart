class EndPoints {
  static const String baserUrl = "https://api.coingecko.com/api/v3/";
  static const String global = "global";
  static const String trending = "search/trending";
  static const String topGainers =
      "coins/markets?vs_currency=usd&order=market_cap_desc";
  static String cryptos({required int page}) =>
      "coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=$page";
  static String searchCoins({required String query}) => "search?query=$query";
  static String coinDetails({required String id}) => "coins/$id";
  static String coinChartData({required String id, required String days, String interval = "daily"}) =>
      "coins/$id/market_chart?vs_currency=usd&days=$days&interval=$interval";
  static const String simplePrice = "simple/price";
}


// simple/price
// ?ids={comma_separated_coin_ids}
// &vs_currencies=usd
// &include_24hr_change=true
