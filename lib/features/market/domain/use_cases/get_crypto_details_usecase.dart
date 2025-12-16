import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/failure.dart';
import 'package:fintech/features/market/domain/entities/crypto_details_entity.dart';
import 'package:fintech/features/market/domain/repos/crypto_details_repository.dart';

class GetCryptoDetailsUsecase {
  final CryptoDetailsRepository repository;
  GetCryptoDetailsUsecase(this.repository);
  Future<Either<Failure, CryptoDetailsEntity>> call({required String id}) async {
   return await repository.getCoinDetails(id: id);
  
  }
}