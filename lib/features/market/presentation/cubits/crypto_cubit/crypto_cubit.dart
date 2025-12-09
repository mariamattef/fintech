import 'package:fintech/features/market/domain/entities/crypto_entity.dart';
import 'package:fintech/core/params/params.dart';
import 'package:fintech/features/market/domain/use_cases/get_crypto_usecase.dart';
import 'package:fintech/features/market/presentation/cubits/crypto_cubit/crypto_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoCubit extends Cubit<CryptoState> {
  final GetCryptoUsecase getCryptoUsecase;
  int _currentPage = 0;
  final List<CryptoEntity> _allCryptos = [];

  CryptoCubit({required this.getCryptoUsecase}) : super(const CryptoState.initial());

  Future<void> getCryptos({required CryptoMarketParams params, bool isLoadMore = false}) async {
    if (!isLoadMore) {
      _currentPage = 0;
      _allCryptos.clear();
      emit(const CryptoState.loading());
    }
    
    _currentPage = params.page;

    final result = await getCryptoUsecase(params);
    result.fold(
      (failure) => emit(CryptoState.error(failure.errorMessage)),
      (cryptos) {
        if (cryptos.isEmpty) {
          emit(CryptoState.success(_allCryptos, _currentPage, false));
        } else {
          _allCryptos.addAll(cryptos);
          emit(CryptoState.success(_allCryptos, _currentPage, true));
        }
      },
    );
  }
}
