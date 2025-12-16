import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/failure.dart';
import 'package:fintech/features/home/domain/enteties/trending_entity.dart';

abstract class TrendingRepository {
  Future<Either<Failure, List<TrendingEntity>>> getTrending();
}
