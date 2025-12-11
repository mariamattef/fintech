class EndPoints {
  static const String baserUrl = "https://api.coingecko.com/api/v3/";
  static const String global = "global";
  static const String trending = "search/trending";
  static const String topGainers =
      "coins/markets?vs_currency=usd&order=market_cap_desc";
  static String cryptos({required int page}) =>
      "coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=$page";
  static String coinDetails({required String id}) => "coins/$id";
  static String coinChartData({required String id, required String days, String interval = "daily"}) =>
      "coins/$id/market_chart?vs_currency=usd&days=$days&interval=$interval";
}
