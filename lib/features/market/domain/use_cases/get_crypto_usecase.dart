import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/failure.dart';
import 'package:fintech/core/params/params.dart';
import 'package:fintech/features/market/domain/entities/crypto_entity.dart';
import 'package:fintech/features/market/domain/repos/crypto_repository.dart';

class GetCryptoUsecase {
  final CryptoRepository repository;
  GetCryptoUsecase(this.repository);
  Future<Either<Failure, List<CryptoEntity>>> call(
    CryptoMarketParams params,
  ) async {
    return await repository.getCryptos(page: params.page);
  }
}
