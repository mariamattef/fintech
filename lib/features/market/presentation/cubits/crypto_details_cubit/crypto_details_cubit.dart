import 'package:dartz/dartz.dart';
import 'package:fintech/features/market/domain/use_cases/get_crypto_details_usecase.dart';
import 'package:fintech/features/market/presentation/cubits/crypto_details_cubit/crypto_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoDetailsCubit extends Cubit<CryptoDetailsState> {
  final GetCryptoDetailsUsecase getCryptoDetailsUseCase;

  CryptoDetailsCubit(this.getCryptoDetailsUseCase)
    : super(const CryptoDetailsState.initial());

  Future<void> loadCryptoDetails(String id) async {
    emit(const CryptoDetailsState.loading());

    final Either failureOrData = await getCryptoDetailsUseCase.call(id: id);

    failureOrData.fold(
      (failure) => emit(CryptoDetailsState.failure(failure.errorMessage)),
      (crypto) => emit(CryptoDetailsState.success(crypto)),
    );
  }
}
