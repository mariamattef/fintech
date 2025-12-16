part of 'portfolio_cubit.dart';

abstract class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object> get props => [];
}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final List<CryptoCurrency> cryptoPrices;

  const PortfolioLoaded({required this.cryptoPrices});

  @override
  List<Object> get props => [cryptoPrices];
}

class PortfolioError extends PortfolioState {
  final String message;

  const PortfolioError({required this.message});

  @override
  List<Object> get props => [message];
}