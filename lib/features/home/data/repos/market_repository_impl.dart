import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/exceptions.dart';
import 'package:fintech/core/errors/failure.dart';
import 'package:fintech/features/home/data/data_source/market_remote_data_source.dart';
import 'package:fintech/features/home/domain/enteties/market_over_view_entity.dart';
import 'package:fintech/features/home/domain/repos/market_repository.dart';

class MarketRepositoryImpl implements MarketRepository {
  final MarketOverviewDataSource dataSource;

  MarketRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, MarketOverviewEntity>> getMarketOverview() async {
    try {
      final result = await dataSource.getMarketOverview();
      return Right(result);
    } on OfflineException {
      return Left(OfflineFailure(
          "No internet connection. Please check your connection and try again."));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.errorMessage));
    }
  }
}
