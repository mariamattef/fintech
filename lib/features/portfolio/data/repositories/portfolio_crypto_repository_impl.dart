import 'package:fintech/features/portfolio/domain/repositories/portfolio_crypto_repository.dart';

import '../../../../core/errors/exceptions.dart';
import '../datasources/portfolio_crypto_remote_datasource.dart';
import '../models/crypto_price_model.dart';


class PortfolioCryptoRepositoryImpl implements PortfolioCryptoRepository {
  final PortfolioCryptoRemoteDataSource remoteDataSource;

  PortfolioCryptoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CryptoPriceModel>> getCryptoPrices(List<String> ids) async {
    try {
      return await remoteDataSource.getCryptoPrices(ids);
    } on ServerException {
      rethrow;
    }
  }
}
