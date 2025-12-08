import 'package:fintech/features/home/domain/enteties/trending_entity.dart';

abstract class TrendingState {}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingSuccess extends TrendingState {
  final List<TrendingEntity> data;
  TrendingSuccess(this.data);
}

class TrendingError extends TrendingState {
  final String message;
  TrendingError(this.message);
}
