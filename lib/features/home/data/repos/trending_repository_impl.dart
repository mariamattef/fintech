import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/failure.dart';
import 'package:fintech/features/home/data/data_source/trending_remote_data_source.dart';
import 'package:fintech/features/home/domain/enteties/trending_entity.dart';
import 'package:fintech/features/home/domain/repos/trending_repository.dart';

class TrendingRepositoryImpl implements TrendingRepository {
  final TrendingRemoteDataSource dataSource;
  TrendingRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<TrendingEntity>>> getTrending() async {
    try {
      final result = await dataSource.getTrendingCoins();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
