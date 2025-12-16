import 'package:dartz/dartz.dart';
import 'package:fintech/features/market/data/data_source/chart_local_data_source.dart';
import 'package:fintech/features/market/data/data_source/chart_remote_data_source.dart';
import 'package:fintech/features/market/domain/repos/chart_repository.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/chart_point_entity.dart';

class ChartRepositoryImpl implements ChartRepository {
  final ChartRemoteDataSource remote;
  final ChartLocalDataSource local;

  ChartRepositoryImpl(this.remote, this.local);

  @override
  Future<Either<Failure, List<ChartPointEntity>>> getChart(
      String id, String days) async {
    try {
      var result = await local.getChart(id, days);
      if (result != null) {
        return Right(result);
      }
      result = await remote.fetchChart(id, days);
      await local.saveChart(id, days, result);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
