import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/failure.dart';
import 'package:fintech/features/market/domain/entities/crypto_details_entity.dart';

abstract class CryptoDetailsRepository {
  Future<Either<Failure, CryptoDetailsEntity>> getCoinDetails(
      {required String id});

}