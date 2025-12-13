import 'package:dartz/dartz.dart';
import 'package:fintech/core/errors/failure.dart';
import 'package:fintech/features/portfolio/domain/entities/transaction_entity.dart';
import 'package:fintech/features/portfolio/domain/repositories/transaction_repository.dart';
import 'package:flutter/material.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<Either<Failure, List<TransactionEntity>>> getTransactions() async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      final List<TransactionEntity> transactions = [
        TransactionEntity(
          title: "Buy Bitcoin",
          amount: "0.01 BTC",
          time: "2 hours ago",
          value: "-\$452.50",
          icon: Icons.arrow_circle_up_rounded,
          iconColor: Colors.green,
        ),
        TransactionEntity(
          title: "Sell Ethereum",
          amount: "0.5 ETH",
          time: "1 day ago",
          value: "+\$1,050.25",
          icon: Icons.arrow_circle_down_rounded,
          iconColor: Colors.red,
        ),
      ];
      return Right(transactions);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch transactions'));
    }
  }
}
