part of 'crypto_price_bloc.dart';

abstract class CryptoPriceEvent extends Equatable {
  const CryptoPriceEvent();

  @override
  List<Object> get props => [];
}

class FetchCryptoPrices extends CryptoPriceEvent {
  final List<String> ids;

  const FetchCryptoPrices(this.ids);

  @override
  List<Object> get props => [ids];
}
