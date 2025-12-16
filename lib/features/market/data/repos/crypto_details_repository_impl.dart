import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/failure.dart';
import 'package:fintech/features/market/data/data_source/crypto_details_remote_data_source.dart';
import 'package:fintech/features/market/domain/entities/crypto_details_entity.dart';
import 'package:fintech/features/market/domain/repos/crypto_details_repository.dart';

class CryptoDetailsRepositoryImpl implements CryptoDetailsRepository {
  CryptoDetailsRemoteDataSource remoteDataSource;
  CryptoDetailsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, CryptoDetailsEntity>> getCoinDetails({
    required String id,
  }) async {
    try {
      final result = await remoteDataSource.getCoinDetails(id: id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
