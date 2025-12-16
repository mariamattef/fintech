import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/failure.dart';
import 'package:fintech/features/home/domain/enteties/trending_entity.dart';
import 'package:fintech/features/home/domain/repos/trending_repository.dart';

class GetTrendingUsecase {
  final TrendingRepository trendingRepository;

  GetTrendingUsecase(this.trendingRepository);

  Future<Either<Failure, List<TrendingEntity>>> call() async {
    return await trendingRepository.getTrending();
  }
}
