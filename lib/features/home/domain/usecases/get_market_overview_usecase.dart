import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/failure.dart';
import 'package:fintech/features/home/domain/enteties/market_over_view_entity.dart';
import 'package:fintech/features/home/domain/repos/market_repository.dart';

class GetMarketOverviewUseCase {
  final MarketRepository repository;

  GetMarketOverviewUseCase(this.repository);

  Future<Either<Failure, MarketOverviewEntity>> call() async {
    return await repository.getMarketOverview();
  }
}
