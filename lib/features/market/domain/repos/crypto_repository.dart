import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/failure.dart';
import 'package:fintech/features/market/domain/entities/crypto_entity.dart';

abstract class CryptoRepository {
  Future<Either<Failure, List<CryptoEntity>>> getCryptos({required int page});
  // Future<Either<Failure, List<CryptoEntity>>> getCharts();
}
