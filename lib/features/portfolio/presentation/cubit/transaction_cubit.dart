import 'package:fintech/features/portfolio/domain/usecases/get_transactions.dart';
import 'package:fintech/features/portfolio/presentation/cubit/transaction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final GetTransactionsUseCase getTransactionsUseCase;

  TransactionCubit(this.getTransactionsUseCase) : super(TransactionInitial());

  Future<void> fetchTransactions() async {
    emit(TransactionLoading());
    final result = await getTransactionsUseCase.call();
    result.fold(
      (failure) => emit(TransactionError(failure.errorMessage)),
      (data) => emit(TransactionSuccess(data)),
    );
  }
}
