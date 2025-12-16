import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart'; 
import '../../domain/entities/crypto_currency.dart';
import '../../domain/repositories/portfolio_crypto_repository.dart';
import '../datasources/portfolio_crypto_remote_datasource.dart'; 

class PortfolioCryptoRepositoryImpl implements PortfolioCryptoRepository { 
  final PortfolioCryptoRemoteDataSource remoteDataSource;

  PortfolioCryptoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CryptoCurrency>>> getCryptoPrices(
      List<String> ids) async {
    try {
      final remotePrices = await remoteDataSource.getCryptoPrices(ids);
      return Right(remotePrices);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}