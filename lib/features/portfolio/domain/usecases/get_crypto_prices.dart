import 'package:dartz/dartz.dart';
import 'package:fintech/core/params/params.dart';

import '../../../../core/errors/failures.dart';
import '../entities/crypto_currency.dart';
import '../repositories/portfolio_crypto_repository.dart'; // Updated import

class GetCryptoPricesUseCase {
  final PortfolioCryptoRepository repository; // Updated type

  GetCryptoPricesUseCase(this.repository);

  Future<Either<Failure, List<CryptoCurrency>>> call(
    GetCryptoPricesParams params,
  ) async {
    return await repository.getCryptoPrices(params.ids);
  }
}
