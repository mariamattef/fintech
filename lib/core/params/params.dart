import 'package:fintech/core/params/base_params.dart';

class TemplateParams {
  final String id;
  TemplateParams({required this.id});
}

class CryptoMarketParams {
  final int page;
  final String query;
  CryptoMarketParams({required this.page, this.query = ''});
}
class GetCryptoPricesParams extends BaseParams {
  final List<String> ids;

  GetCryptoPricesParams({required this.ids});

  @override
  List<Object?> get props => [ids];
}