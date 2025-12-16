import 'package:fintech/features/home/domain/usecases/get_trending_usecase.dart';
import 'package:fintech/features/home/presentation/cubits/trending_cubit/trending_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingCubit extends Cubit<TrendingState> {
  final GetTrendingUsecase getTrendingUsecase;
  TrendingCubit(this.getTrendingUsecase) : super(TrendingInitial());

  Future<void> fetchTrending() async {
    emit(TrendingLoading());

    try {
      await Future.delayed(Duration(seconds: 2));
      final result = await getTrendingUsecase.call();

      result.fold(
        (failure) => emit(TrendingError(failure.errorMessage)),
        (data) => emit(TrendingSuccess(data)),
      );
    } catch (e) {
      emit(TrendingError(e.toString()));
    }
  }
}
