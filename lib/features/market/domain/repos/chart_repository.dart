import 'package:dartz/dartz.dart';
import '../entities/chart_point_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class ChartRepository {
  Future<Either<Failure, List<ChartPointEntity>>> getChart(
    String id,
    String days,
  );
}
