part of 'crypto_price_bloc.dart';

abstract class CryptoPriceState extends Equatable {
  const CryptoPriceState();

  @override
  List<Object> get props => [];
}

class CryptoPriceInitial extends CryptoPriceState {}

class CryptoPriceLoading extends CryptoPriceState {}

class CryptoPriceLoaded extends CryptoPriceState {
  final List<CryptoPriceModel> cryptoPrices;

  const CryptoPriceLoaded(this.cryptoPrices);

  @override
  List<Object> get props => [cryptoPrices];
}

class CryptoPriceError extends CryptoPriceState {
  final String message;

  const CryptoPriceError(this.message);

  @override
  List<Object> get props => [message];
}
