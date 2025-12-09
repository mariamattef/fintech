import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/failure.dart';
import 'package:fintech/features/home/data/data_source/topgainer_remote_data_source.dart';
import 'package:fintech/features/home/domain/enteties/topgainer_entity.dart';
import 'package:fintech/features/home/domain/repos/topgainer_repository.dart';

class TopgainerRepositoryImpl implements TopgainerRepository {
  final TopgainerRemoteDataSource dataSource;
  TopgainerRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<TopgainerEntity>>> getTopGainers() async {
    try {
      final reault = await dataSource.fetchTopGainers();
      return Right(reault);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
