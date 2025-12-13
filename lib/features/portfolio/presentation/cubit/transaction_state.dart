import 'package:fintech/features/portfolio/domain/entities/transaction_entity.dart';

abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final List<TransactionEntity> transactions;
  TransactionSuccess(this.transactions);
}

class TransactionError extends TransactionState {
  final String message;
  TransactionError(this.message);
}
