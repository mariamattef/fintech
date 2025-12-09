import 'package:fintech/features/home/presentation/cubits/overview_cubit/overview_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fintech/features/home/domain/usecases/get_market_overview_usecase.dart';

class MarketOverviewCubit extends Cubit<MarketOverviewState> {
  final GetMarketOverviewUseCase getMarketOverviewUseCase;

  MarketOverviewCubit(this.getMarketOverviewUseCase)
    : super(MarketOverviewInitial());

  Future<void> getOverview() async {
    emit(MarketOverviewLoading());

    final result = await getMarketOverviewUseCase();

    result.fold(
      (failure) => emit(MarketOverviewError(failure.errorMessage)),
      (entity) => emit(MarketOverviewSuccess(entity)),
    );
  }
}

// Exception has occurred.
// StateError (Bad state: Cannot emit new states after calling close)
