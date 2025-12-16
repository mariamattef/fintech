import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/exceptions.dart';
import '../../data/models/crypto_price_model.dart';
import '../../domain/repositories/portfolio_crypto_repository.dart';

part 'crypto_price_event.dart';
part 'crypto_price_state.dart';

class CryptoPriceBloc extends Bloc<CryptoPriceEvent, CryptoPriceState> {
  final PortfolioCryptoRepository repository;

  CryptoPriceBloc({required this.repository}) : super(CryptoPriceInitial()) {
    on<FetchCryptoPrices>(_onFetchCryptoPrices);
  }

  void _onFetchCryptoPrices(
      FetchCryptoPrices event, Emitter<CryptoPriceState> emit) async {
    emit(CryptoPriceLoading());
    try {
      final cryptoPrices = await repository.getCryptoPrices(event.ids);
      emit(CryptoPriceLoaded(cryptoPrices));
    } on ServerException catch (e) {
      emit(CryptoPriceError(e.errorModel.errorMessage ?? 'Unknown error'));
    } catch (e) {
      emit(CryptoPriceError(e.toString()));
    }
  }
}
