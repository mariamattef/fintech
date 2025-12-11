import 'package:dartz/dartz.dart';
import 'package:fintech/features/market/domain/repos/chart_repository.dart';
import '../../../../core/errors/failure.dart';
import '../entities/chart_point_entity.dart';

class GetChartUseCase {
  final ChartRepository repo;

  GetChartUseCase(this.repo);

  Future<Either<Failure, List<ChartPointEntity>>> call(
    String id,
    String days,
  ) {
    return repo.getChart(id, days);
  }
}
