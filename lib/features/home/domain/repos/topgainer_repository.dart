import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/failure.dart';
import 'package:fintech/features/home/domain/enteties/topgainer_entity.dart';

abstract class TopgainerRepository {
  Future<Either<Failure, List<TopgainerEntity>>> getTopGainers();
}
