import 'package:fintech/features/home/domain/usecases/get_topgainer_usecase.dart';
import 'package:fintech/features/home/presentation/cubits/topgainers_cubit/topgainers_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopgainersCubit extends Cubit<TopgainersState> {
  TopgainersCubit(this.getTopgainerUsecase) : super(TopgainersInitial());

  final GetTopgainerUsecase getTopgainerUsecase;

  Future<void> fetchTopGainers() async {
    emit(TopgainersLoading());
    try {
      final topGainers = await getTopgainerUsecase.call();
      topGainers.fold(
        (failure) => emit(TopgainersFailure(failure.errorMessage)),
        (entity) => emit(TopgainersSuccess(entity)),
      );
    } catch (e) {
      emit(TopgainersFailure(e.toString()));
    }
  }
}
