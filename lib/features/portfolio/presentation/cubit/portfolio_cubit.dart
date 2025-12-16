import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fintech/core/errors/failures.dart';
import 'package:fintech/core/params/params.dart';
import 'package:fintech/features/portfolio/domain/entities/crypto_currency.dart';
import 'package:fintech/features/portfolio/domain/usecases/get_crypto_prices.dart';

part 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  final GetCryptoPricesUseCase getCryptoPricesUseCase;

  PortfolioCubit({required this.getCryptoPricesUseCase})
    : super(PortfolioInitial());

  Future<void> fetchCryptoPrices(List<String> ids) async {
    emit(PortfolioLoading());
    final failureOrCryptoPrices = await getCryptoPricesUseCase(
      GetCryptoPricesParams(ids: ids),
    );
    failureOrCryptoPrices.fold(
      (failure) => emit(PortfolioError(message: _mapFailureToMessage(failure))),
      (cryptoPrices) => emit(PortfolioLoaded(cryptoPrices: cryptoPrices)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return 'Server Error: ${failure.message}';
      case ConnectionFailure _:
        return 'Connection Error: ${failure.message}';
      // Add more cases as needed
      default:
        return 'Unexpected Error: ${failure.message}';
    }
  }
}
