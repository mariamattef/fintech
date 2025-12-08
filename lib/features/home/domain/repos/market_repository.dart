import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/failure.dart';
import 'package:fintech/features/home/domain/enteties/market_over_view_entity.dart';


abstract class MarketRepository {
  Future<Either<Failure, MarketOverviewEntity>> getMarketOverview();
}
