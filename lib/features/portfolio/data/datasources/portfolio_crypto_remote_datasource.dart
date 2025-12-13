import 'package:dio/dio.dart';

import '../../../../core/databases/api/end_points.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/crypto_price_model.dart';

abstract class PortfolioCryptoRemoteDataSource {
  Future<List<CryptoPriceModel>> getCryptoPrices(List<String> ids);
}

class PortfolioCryptoRemoteDataSourceImpl
    implements PortfolioCryptoRemoteDataSource {
  final Dio client;

  PortfolioCryptoRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CryptoPriceModel>> getCryptoPrices(List<String> ids) async {
    final String idsString = ids.join(',');
    try {
      final response = await client.get(
        '${EndPoints.baserUrl}coins/markets?vs_currency=usd&ids=$idsString',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data;
        final List<CryptoPriceModel> cryptoPrices = jsonResponse
            .map((json) => CryptoPriceModel.fromMarketsJson(json))
            .toList();
        return cryptoPrices;
      } else {
        throw ServerException(ErrorModel(
            errorMessage: 'Unknown error', status: response.statusCode));
      }
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      throw ServerException(ErrorModel(errorMessage: e.toString()));
    }
  }
}