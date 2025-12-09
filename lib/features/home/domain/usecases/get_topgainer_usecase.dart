import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/failure.dart';
import 'package:fintech/features/home/domain/enteties/topgainer_entity.dart';
import 'package:fintech/features/home/domain/repos/topgainer_repository.dart';

class GetTopgainerUsecase {
  final TopgainerRepository repository;

  GetTopgainerUsecase(this.repository);

  Future<Either<Failure, List<TopgainerEntity>>> call() {
    return repository.getTopGainers();
  }
}
