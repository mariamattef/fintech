import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/failure.dart';

import 'package:fintech/features/market/data/data_source/crypto_remote_data_source.dart';
import 'package:fintech/features/market/domain/entities/crypto_entity.dart';
import 'package:fintech/features/market/domain/repos/crypto_repository.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  final CryptoRemoteDataSource remoteDataSource;

  CryptoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CryptoEntity>>> getCryptos({
    required int page,
  }) async {
    try {
      final result = await remoteDataSource.getCryptos(page: page);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
        }
      }
    
      @override
      Future<Either<Failure, List<CryptoEntity>>> searchCryptos({required String query}) async {
        try {
          final result = await remoteDataSource.searchCryptos(query: query);
          return Right(result);
        } catch (e) {
          return Left(ServerFailure(e.toString()));
        }
      }
    
    
      //  @override
      // Future<Either<Failure, List<CryptoEntity>>> getCryptos() async {
      //   try {
      //     final result = await remote.fetchCryptos();
      //     return Right(result);
      //   } catch (e) {
      //     return Left(ServerFailure(e.toString()));
      //   }
      // }
    }
    
